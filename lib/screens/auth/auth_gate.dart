import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:locapp/screens/home/root.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider()
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
             return const Padding(
               padding: EdgeInsets.all(20),
               child: AspectRatio(
                 aspectRatio: 1,
                 child: Text("LocApp", style: TextStyle()),
               ),
             );
           },
          );
        }

        return const Root();
      },
    );
  }
}