import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/services/auth_service.dart';
import 'package:chat/core/services/database_service.dart';
import 'package:chat/ui/screens/home/home_viewmodel.dart';
import 'package:chat/ui/screens/other/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(DatabaseService()),
      child: Consumer<HomeViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Center(
              child: InkWell(
                onTap: () {
                  AuthService().logout();
                },
                child:
                    userProvider ==null
                        ? CircularProgressIndicator()
                        : Text(userProvider.user.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
