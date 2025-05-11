import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.loading = false,
  });

  final void Function()? onPressed;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 1.sw,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: primary),
        onPressed: onPressed,
        child:
            loading
                ? Center(child: CircularProgressIndicator())
                : Text(text, style: body.copyWith(color: white,)),
      ),
    );
  }
}
