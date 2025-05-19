import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:chat/core/extension/widget_extension.dart';
import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/services/chat_service.dart';
import 'package:chat/ui/screens/bottom_navigation/chat_list/chat_room/chat_screen_viewmodel.dart';
import 'package:chat/ui/screens/bottom_navigation/chat_list/chat_room/chat_screen_widgets.dart';
import 'package:chat/ui/screens/other/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.receiver});
  final UserModel receiver;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create:
          (context) =>
              ChatScreenViewmodel(ChatService(), currentUser!, receiver),
      child: Consumer<ChatScreenViewmodel>(
        builder: (context, model, _) {
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
                        ChatScreenHeader(context, name: receiver.name!),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder:
                                (context, index) => 10.verticalSpace,
                            itemCount: model.messages.length,
                            itemBuilder: (context, index) {
                              final message = model.messages[index];
                              return chatBubble(
                                isCurrenUser:
                                    message.senderId == currentUser!.uid,
                                message: message,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ChatBottomField(
                  controller: model.controller,
                  onTap: () async {
                    try {
                      await model.saveMessage();
                    } catch (e) {
                      context.showSnackbar(e.toString());
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Row ChatScreenHeader(BuildContext context, {String name = ""}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 10),
          decoration: BoxDecoration(
            color: grey.withAlpha(50),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
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
