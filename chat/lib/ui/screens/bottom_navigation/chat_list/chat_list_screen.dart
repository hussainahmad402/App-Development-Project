import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/string.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:chat/ui/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
      child: Column(
        children: [
          30.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Chats", style: h),
          ),
          20.verticalSpace,
          customtextfield(hinttext: "Search here .. ", isSearch: true),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              itemCount: 10,
              separatorBuilder: (context, index) => 8.verticalSpace,
              itemBuilder: (context, index) => ChatTile(onTap: () => Navigator.pushNamed(context, chatRoom),),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({super.key,this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10.w),
      tileColor: grey.withAlpha(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text("data"),
      subtitle: Text("Subtitle",maxLines: 1,overflow: TextOverflow.ellipsis,),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("10 Min Ago",style:TextStyle(color: grey),),
          8.verticalSpace,
          CircleAvatar(
            radius: 10.r,
            backgroundColor: primary,
            child: Text("1", style: small.copyWith(color: white)),
          ),
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: grey,
        radius: 25,
        child: Text("H"),
      ),
    );
  }
}
