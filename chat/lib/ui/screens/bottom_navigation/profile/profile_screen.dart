import 'package:chat/core/services/auth_service.dart';
import 'package:chat/ui/screens/other/user_provider.dart';
import 'package:chat/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (user?.imageurl != null && user!.imageurl!.isNotEmpty)
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.imageurl!),
                ),
              if (user != null) ...[
                SizedBox(height: 20),
                Text(
                  user.name ?? 'No Name',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  user.email ?? 'No Email',
                  style: TextStyle(fontSize: 30, color: Colors.grey[700]),
                ),
                SizedBox(height: 30),
              ],
              CustomButton(
                text: "Logout",
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false).clearUser();
                  AuthService().logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
