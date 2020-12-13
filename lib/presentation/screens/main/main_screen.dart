import 'package:flutter/material.dart';
import 'package:treecredz_admin/presentation/themes/theme.dart';
import 'package:treecredz_admin/presentation/widgets/circle_tab_indicator.dart';
import 'package:treecredz_admin/presentation/widgets/info_widget.dart';
import 'package:treecredz_admin/presentation/widgets/scan_widget.dart';
import 'package:treecredz_admin/presentation/widgets/small_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _pageController = PageController();

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(18),
            child: SmallTitleWidget(),
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: cardColor,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              height: 50,
              child: TabBar(
                controller: _tabController,
                onTap: (value) {
                  _pageController.animateToPage(
                    value,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  );
                },
                tabs: [
                  Tab(text: 'Scan'),
                  Tab(text: 'Info'),
                ],
                labelPadding: EdgeInsets.symmetric(horizontal: 48),
                labelColor: darkGreen,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                isScrollable: true,
                indicator: CircleTabIndicator(
                  color: Theme.of(context).primaryColor,
                  radius: 3,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ScanWidget(),
                InfoWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
