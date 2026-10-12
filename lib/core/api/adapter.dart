import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// import '../utils/logger.dart';
import 'models/result/better_error.dart';
import 'models/result/result.dart';

class BetterAuthCallAdapter<T>
    extends CallAdapter<Future<HttpResponse<T>>, Future<Result<T>>> {
  @override
  Future<Result<T>> adapt(Future<HttpResponse<T>> Function() call) async {
    try {
      final httpResponse = await call();
      final data = httpResponse.data;
      return Result<T>.ok(data);
    } on DioException catch (e, s) {
      final res = e.response;
      // logger.i(res?.headers);
      // final status = res?.statusCode;
      // logger.e("DioException", error: e, stackTrace: s);
      // logger.e("Status: $status, Body: $body");
      // Body may be non-JSON (e.g. an HTML 502 page) or lack code/message.
      final body = res?.data;
      final code = body is Map ? body['code'] : null;
      final message = body is Map ? body['message'] : null;
      return Result.err(
        BetterError(
          code: code is String ? code : "ERROR",
          message: message is String ? message : (e.message ?? e.toString()),
          stack: s.toString(),
          dioType: res == null ? e.type.name : null,
        ),
      );
    } catch (e, s) {
      // A 2xx body that doesn't fit the model (TypeError/FormatException).
      return Result.err(
        BetterError(
          code: e is TypeError || e is FormatException ? 'PARSE_ERROR' : 'ERROR',
          message: e.toString(),
          stack: s.toString(),
        ),
      );
    }
  }
}
