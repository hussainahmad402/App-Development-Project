import 'package:chat/ui/screens/home/home_screen.dart';
import 'package:chat/ui/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        final user = snapshot.data;

        if (user == null) {
          return Login();
        }
        else{
          return HomeScreen(uid: user.uid,);
        }
      },
    );
  }
}
