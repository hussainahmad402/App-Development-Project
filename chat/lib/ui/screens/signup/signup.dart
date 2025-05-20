import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/string.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/extension/widget_extension.dart';
import 'package:chat/core/services/auth_service.dart';
import 'package:chat/core/services/database_service.dart';
import 'package:chat/core/services/storage_service.dart';
import 'package:chat/ui/screens/signup/signup_viewmodel.dart';
import 'package:chat/ui/widgets/custom_button.dart';
import 'package:chat/ui/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/find_locale.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupViewmodel(AuthService(), DatabaseService(),
      // StorageService()
      ),
      child: Consumer<SignupViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.sw * 0.05,
                vertical: 10.h,
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      50.verticalSpace,
                      Text("Create Your Account", style: h),
                      10.verticalSpace,
                      Text("Please Provide the details", style: body),
                      // 10.verticalSpace,
                      // InkWell(
                        // onTap: () => model.pickImage(),
                        // child: 
                        // model.image==null?
                        
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: grey.withAlpha(100),
                          child: Icon(Icons.camera_alt),
                        ),
                        // :
                        // CircleAvatar(
                        //   radius: 30.r,
                        //   backgroundImage: FileImage(model.image!),
                          
                        // ),
                      // ),
                      10.verticalSpace,
                      customtextfield(
                        hinttext: "Enter Name",
                        onChanged: model.setName,
                      ),
                      30.verticalSpace,
                      customtextfield(
                        hinttext: "Enter Email",
                        onChanged: model.setEmail,
                      ),
                      30.verticalSpace,
                      customtextfield(
                        hinttext: "Enter Password",
                        onChanged: model.setPassword,
                        isPassword: true,
                      ),
                      30.verticalSpace,
                      customtextfield(
                        hinttext: "Confirm Password",
                        onChanged: model.confirmPassword,
                        isPassword: true,
                      ),
                      40.verticalSpace,
                      CustomButton(
                        loading: model.state == ViewState.loading,
                        text: "Sign Up",
                        onPressed:
                            model.state == ViewState.loading
                                ? null
                                : () async {
                                  try {
                                    await model.signup();
                                    context.showSnackbar(
                                      "User SignUp Successfully",
                                    );
                                    Navigator.pop(context);
                                  } on FirebaseAuthException catch (e) {
                                    context.showSnackbar(e.toString());
                                  }
                                },
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ? ",
                            style: body.copyWith(color: grey, fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, login);
                            },
                            child: Text(
                              "Login",
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
