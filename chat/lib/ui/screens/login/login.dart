import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/string.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/extension/widget_extension.dart';
import 'package:chat/core/services/auth_service.dart';
import 'package:chat/ui/screens/login/login_viewmodel.dart';
import 'package:chat/ui/widgets/custom_button.dart';
import 'package:chat/ui/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewmodel(AuthService()),
      child: Consumer<LoginViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.sw * 0.05,
                vertical: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  50.verticalSpace,
                  Text("Login", style: h),
                  10.verticalSpace,
                  Text("Please Login to your account", style: body),
                  30.verticalSpace,
                  customtextfield(
                    hinttext: "Enter Email",
                    onChanged: model.setEmail,
                  ),
                  30.verticalSpace,
                  customtextfield(
                    hinttext: "Enter Password",
                    onChanged: model.setPassword,
                  ),
                  40.verticalSpace,
                  CustomButton(
                    loading: model.state == ViewState.loading,
                    onPressed:
                        model.state == ViewState.loading
                            ? null
                            : () async {
                              try {
                                await model.login();
                                context.showSnackbar(
                                  "User SignIn Successfully",
                                );
                              } on FirebaseAuthException catch (e) {
                                context.showSnackbar(e.toString());
                              }
                            },
                    text: "Login",
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ",
                        style: body.copyWith(color: grey, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, signup);
                        },
                        child: Text(
                          "Sign Up",
                          style: body.copyWith(
                            color: primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
