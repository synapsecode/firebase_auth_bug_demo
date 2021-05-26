import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

FirebaseAuth fa = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      home: AuthDemo(),
    );
  }
}

class AuthDemo extends StatelessWidget {
  const AuthDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AuthDemo"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await fa.signInAnonymously();
            },
            child: Text("Anon"),
          ),
          ElevatedButton(
            onPressed: () async {
              await fa.signOut();
            },
            child: Text("SignOut"),
          ),
          SizedBox(height: 20),
          StreamBuilder(
            stream: fa.authStateChanges(),
            builder: (context, snapshot) {
              return Text(snapshot.data?.uid ?? "[NULL]");
            },
          )
        ],
      ),
    );
  }
}
