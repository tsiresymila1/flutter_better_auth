import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterBetterAuth.initialize(
    url: 'https://b7def5a952f2.ngrok-free.app/api/auth',
  );
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
              spacing: 8,
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
                      callbackURL: "/auth-callback",
                      callbackUrlScheme: "myapp",
                    );
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
