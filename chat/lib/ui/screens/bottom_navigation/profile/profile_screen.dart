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
    return Scaffold(
      body: Column(
        children: [
          50.verticalSpace,
          CustomButton(
            text: "Logout",
            onPressed: () {
              Provider.of<UserProvider>(context,listen: false).clearUser();
              AuthService().logout();
              
            },
          ),
        ],
      ),
    );
  }
}
