import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtextfield extends StatelessWidget {
  const customtextfield({
    super.key,this.onChanged,this.hinttext,this.focusNode,this.isSearch=false,this.isChat=false
  });

  final void Function(String)? onChanged;
  final String? hinttext;
  final FocusNode? focusNode;
  final bool isSearch;
  final bool isChat;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged:onChanged ,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(color: grey),
        suffixIcon: isSearch? Container(
          height: 55,
          width: 55,
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(color: primary,borderRadius: BorderRadius.circular(8.r)),
          child: Image.asset(searchIcon,),
        ):null,
        fillColor:isChat ?white: grey.withAlpha(80),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(isChat?25.r:8.r),
        ),
      ),
    );
  }
}
