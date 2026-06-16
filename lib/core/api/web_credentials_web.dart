import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

/// Web: let the browser store and send cookies (it owns the `Cookie` header,
/// which JavaScript is not allowed to set).
void enableWebCredentials(Dio dio) {
  final adapter = dio.httpClientAdapter;
  if (adapter is BrowserHttpClientAdapter) {
    adapter.withCredentials = true;
  } else {
    dio.httpClientAdapter = BrowserHttpClientAdapter()..withCredentials = true;
  }
}
