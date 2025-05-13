import 'package:chat/core/constants/string.dart';
import 'package:chat/ui/screens/bottom_navigation/bottom_navigation_viewmodel.dart';
import 'package:chat/ui/screens/bottom_navigation/chat_list/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  static final List<Widget> _screens = [
    Center(child: const Text("First Screen")),
    const ChatListScreen(),
    Center(child: const Text("Third Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationViewmodel(),
      child: Consumer<BottomNavigationViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: BottomNavigationScreen._screens[model.currentIndex],

            bottomNavigationBar: BottomNavBar(onTap: model.setIndex,items: [ 
            BottomNavigationBarItem(
              label: "",
              icon: BottomNavIconButton(iconPath: homeIcon,),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: BottomNavIconButton(iconPath: chatIcon,),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: BottomNavIconButton(iconPath: profileIcon,),
            ),
            
          ],),
          );
        },
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.onTap, required this.items});
  final void Function(int)? onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BottomNavigationBar(onTap: onTap, items: items),
      ),
    );
  }
}

class BottomNavIconButton extends StatelessWidget {
  const BottomNavIconButton({super.key, required this.iconPath});
  final iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Image.asset(iconPath, height: 35),
    );
  }
}
