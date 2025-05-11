import 'package:chat/core/constants/string.dart';
import 'package:chat/ui/screens/home/home_screen.dart';
import 'package:chat/ui/screens/login/login.dart';
import 'package:chat/ui/screens/signup/signup.dart';
import 'package:chat/ui/screens/splash/splash_screen.dart';
import 'package:chat/ui/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen(uid: args as String,));
      case signup:
        return MaterialPageRoute(builder: (context) => Signup());
      case login:
        return MaterialPageRoute(builder: (context) => Login());
      case wrapper:
        return MaterialPageRoute(builder: (context) => Wrapper());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(body: Center(child: Text("No Route Found"),),));
    }

    
  }
}
