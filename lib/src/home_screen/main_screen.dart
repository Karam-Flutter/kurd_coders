// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kurd_coders/src/constants/assets.dart';
import 'package:kurd_coders/src/home_screen/screens/home_screen.dart';
import 'package:kurd_coders/src/home_screen/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavigatorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _myNavigationBar,
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Positioned.fill(child: _body),
          Positioned(bottom: 16, left: 16, right: 16, child: _myNavigationBar),
        ],
      ),
    );
  }

  Widget get _body {
    switch (_selectedNavigatorIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  Widget get _myNavigationBar {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withAlpha(100),
            offset: Offset(2, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          navigationCell(
              title: "Home", imagePath: Assets.resourceIconsHomeIcon, index: 0),
          navigationCell(
              title: "Profile",
              imagePath: Assets.resourceIconsProfile,
              index: 1),
        ],
      ),
    );
  }

  GestureDetector navigationCell({
    required String title,
    required String imagePath,
    required int index,
  }) {
    var isSelected = _selectedNavigatorIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavigatorIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? Color(0xff5e9c8d) : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              imagePath,
              width: 16,
              height: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
