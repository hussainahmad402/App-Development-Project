import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:chat/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBottomField extends StatelessWidget {
  const ChatBottomField({super.key, this.onChanged, this.onTap});

  final void Function(String)? onChanged;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey.withAlpha(50),
      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 20.h),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: CircleAvatar(backgroundColor: white, child: Icon(Icons.add)),
          ),
          10.horizontalSpace,
          Expanded(
            child: customtextfield(
              isChat: true,
              hinttext: "Write message.. ",
              onChanged: (p0) {},
            ),
          ),
        ],
      ),
    );
  }
}

class chatBubble extends StatelessWidget {
  const chatBubble({super.key, this.isCurrenUser = true});

  final bool isCurrenUser;

  @override
  Widget build(BuildContext context) {
    final borderRadius =
        isCurrenUser
            ? BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            )
            : BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            );
    final alignment =
        isCurrenUser ? Alignment.centerRight : Alignment.centerLeft;
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: 1.sw * 0.7, minWidth: 50.w),
        decoration: BoxDecoration(
          color: isCurrenUser ? primary : grey.withAlpha(50),
          borderRadius: borderRadius,
        ),

        child: Column(
          crossAxisAlignment:isCurrenUser? CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            
            Text(
              "data",
              style: body.copyWith(color: isCurrenUser ? white : null),
            ),
            5.verticalSpace,
            Text("08:00 PM ",style: small.copyWith(color:isCurrenUser? white:primary),)
          ],
        ),
      ),
    );
  }
}
