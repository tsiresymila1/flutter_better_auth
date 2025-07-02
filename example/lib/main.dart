import 'package:flutter/material.dart';
import 'package:flutter_better_auth/core/utils/logger.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterBetterAuth.initialize(url: 'http://10.0.2.2:3000/api/auth');
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BetterAuthProvider(
      child: MaterialApp(
        title: 'BetterAuth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Better Auth'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BetterAuthConsumer(
        builder: (context, client) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FilledButton(
                  onPressed: () async {
                    final result = await client.signIn.email(
                      email: "test@mail.com",
                      password: "123456788",
                    );
                    if (result.data != null) {
                      debugPrint(result.data.toString());
                    } else {
                      debugPrint(result.error?.message);
                    }
                  },
                  child: Text("Sign-in"),
                ),

                FilledButton(
                  onPressed: () async {
                    final result = await client.getSession();
                    if (result.data != null) {
                      debugPrint(result.data.toString());
                    } else {
                      debugPrint(result.error?.message);
                    }
                  },
                  child: Text("GetSession"),
                ),
                FilledButton(
                  onPressed: () {
                    client.signOut();
                  },
                  child: Text("SignOut"),
                ),
                FilledButton(
                  onPressed: () async {
                    final res = await client.signIn.social(
                      provider: 'github',
                      disableRedirect: true,
                      callbackURL: 'betterapp://oauth-callback',
                    );
                    if (res is Success<SignInSocialResponse>) {
                      logger.i(res.data.url);
                      final uri = Uri.parse(res.data.url);
                      final newUri = uri.replace(
                        queryParameters: {
                          ...uri.queryParameters,
                          "redirect_uri": 'betterapp://oauth-callback',
                        },
                      );
                      final result = await FlutterWebAuth2.authenticate(
                        url: newUri.toString(),
                        callbackUrlScheme: 'betterapp',
                      );
                      logger.i(result);
                      final uriCode = Uri.parse(result);
                      final code = uriCode.queryParameters['code'];
                      final state = uriCode.queryParameters['state'];
                      if (code != null) {
                        final callbackRes = await client.social.callback(
                          provider: 'github',
                          code: code,
                          state: state,
                        );
                        logger.i(callbackRes);
                      }
                    }
                    return;
                    // OAuth2Client ghClient = GitHubOAuth2Client(
                    //   redirectUri: "betterapp://oauth-callback",
                    //   customUriScheme: 'betterapp',
                    // );
                    // final res = await ghClient.getTokenWithAuthCodeFlow(
                    //   clientId: dotenv.get('GITHUB_CLIENT_ID'),
                    //   scopes: ['user', 'email'],
                    //   clientSecret: dotenv.get('GITHUB_CLIENT_SECRET'),
                    // );
                    // logger.i(res.toMap());
                    //
                    // final resu = await client.signIn.social(
                    //   body: SignInSocialBody(
                    //     disableRedirect: true,
                    //     provider: "github",
                    //     idToken: SocialIdToken(
                    //         token: res.toString(),
                    //         accessToken: res.accessToken,
                    //         refreshToken: res.refreshToken,
                    //         expiresAt: res.expiresIn,
                    //     ),
                    //   ),
                    // );
                    // logger.i(resu);
                    // logger.i(result);
                    // logger.i(code);
                  },
                  child: Text("Github"),
                ),

                FilledButton(
                  onPressed: () async {
                    final result = await client.signUp.email(
                      name: "test",
                      email: "test@mail.com",
                      password: "123456788",
                    );
                    if (result.data != null) {
                      debugPrint(result.data.toString());
                    } else {
                      debugPrint(result.error?.message);
                    }
                  },
                  child: Text("SignUp"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
