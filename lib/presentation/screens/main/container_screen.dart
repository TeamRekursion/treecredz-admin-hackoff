import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:treecredz_admin/presentation/screens/main/main_screen.dart';
import 'package:treecredz_admin/presentation/screens/main/profile_screen.dart';
import 'package:treecredz_admin/presentation/screens/main/statistics_screen.dart';

class ContainerScreen extends StatefulWidget {
  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int _currIndex = 0;
  final _screens = [
    HomeScreen(),
    StatisticsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currIndex],
      bottomNavigationBar: Card(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        color: Colors.white,
        child: SalomonBottomBar(
          currentIndex: _currIndex,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          onTap: (value) {
            setState(() {
              _currIndex = value;
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.stacked_line_chart_outlined),
              title: Text('Statistics'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
