import 'package:chat/core/services/database_service.dart';
import 'package:chat/core/utils/route_utils.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/ui/screens/other/user_provider.dart';
import 'package:chat/ui/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:
          (context, child) =>
              ChangeNotifierProvider(
                create: (context) => UserProvider(DatabaseService() ),
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: RouteUtils.onGenerateRoute,
                  home:SplashScreen()),
              ),
    );
  }
}
