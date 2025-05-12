import 'package:chat/core/constants/string.dart';
import 'package:chat/ui/screens/bottom_navigation/chat_list_screen.dart';
import 'package:flutter/material.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  static final List<Widget> _screens = [
    Center(child: const Text("First Screen")),
    const ChatListScreen(),
    Center(child: const Text("Third Screen"))
  ];

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _currentindex = 1;
  onTap(int index){
    _currentindex = index;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationScreen._screens[_currentindex],
      
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                label: "",
                icon: Padding(
                  
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(homeIcon, height: 35),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Image.asset(chatIcon, height: 35),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(profileIcon, height: 35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
