import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/services/auth_service.dart';
import 'package:chat/core/services/database_service.dart';
import 'package:chat/ui/screens/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewmodel(DatabaseService(), uid),
      child: Consumer<HomeViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Center(
              child: InkWell(
                onTap: () {
                  AuthService().logout();
                },
                child:
                    model.state == ViewState.loading
                        ? CircularProgressIndicator()
                        : Text(model.currentUser.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
