import 'package:chat/core/constants/colors.dart';
import 'package:chat/core/constants/string.dart';
import 'package:chat/core/constants/styles.dart';
import 'package:chat/core/enums/enums.dart';
import 'package:chat/core/models/user_model.dart';
import 'package:chat/core/services/database_service.dart';
import 'package:chat/ui/screens/bottom_navigation/chat_list/chat_list_viewmodel.dart';
import 'package:chat/ui/screens/other/user_provider.dart';
import 'package:chat/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create: (context) => ChatListViewmodel(DatabaseService(),currentUser!),
      child: Consumer<ChatListViewmodel>(
        builder: (context,model,_) {
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
                customtextfield(hinttext: "Search here .. ", isSearch: true,onChanged: model.search,),
                model.state==ViewState.loading?Expanded(child: Center(child: CircularProgressIndicator( ),)):model.users.isEmpty?Expanded(child: Center(child: Text("No User Yet"),)) :Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    itemCount: model.filteredUsers.length,
                    separatorBuilder: (context, index) => 8.verticalSpace,
                    itemBuilder: (context, index) {
                      final user =  model.filteredUsers[index];
                      return  ChatTile(user: user ,onTap: () => Navigator.pushNamed(context, chatRoom,arguments: user));}
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({super.key,this.onTap,required this.user});
  final UserModel user;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10.w),
      tileColor: grey.withAlpha(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(user.name!),
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
        child: Text(user.name![0],style: h.copyWith(fontSize: 25,color: white),),
      ),
    );
  }
}
