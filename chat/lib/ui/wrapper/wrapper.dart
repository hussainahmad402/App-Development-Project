import 'package:chat/ui/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:chat/ui/screens/home/home_screen.dart';
import 'package:chat/ui/screens/login/login.dart';
import 'package:chat/ui/screens/other/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});


  @override
  Widget build(BuildContext context) {
    final userProvider= Provider.of<UserProvider>(context,listen: false);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        final user = snapshot.data;

        if (user == null) {
          return Login();
        }
        else{
          userProvider.loadUser(user.uid);
          return BottomNavigationScreen();
        }
      },
    );
  }
}
