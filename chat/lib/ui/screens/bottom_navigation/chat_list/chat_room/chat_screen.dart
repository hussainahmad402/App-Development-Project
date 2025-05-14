import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:chat/ui/screens/bottom_navigation/chat_list/chat_room/chat_screen_widgets.dart';
import 'package:chat/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.sw * 0.05,
                vertical: 10.h,
              ),
              child: Column(
                children: [
                  30.verticalSpace,
                  ChatScreenHeader(context,name: "Hussain Ahmad"),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 10.verticalSpace,
                      itemCount: 5,
                      itemBuilder:
                          (context, index) => chatBubble(isCurrenUser: false),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ChatBottomField(onChanged: (p0) {}, onTap: () {}),
        ],
      ),
    );
  }

  Row ChatScreenHeader(BuildContext context,{String name = ""}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 10),
          decoration: BoxDecoration(
            color: grey.withAlpha(50),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: InkWell(onTap: () => Navigator.pop(context),child: Icon(Icons.arrow_back_ios)),
        ),
        20.horizontalSpace,
        Text(name, style: h.copyWith(fontSize: 19.sp)),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          decoration: BoxDecoration(
            color: grey.withAlpha(50),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(Icons.more_vert_outlined),
        ),
      ],
    );
  }
}

