import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:treecredz_admin/presentation/animations/show_up.dart';
import 'package:treecredz_admin/presentation/themes/theme.dart';
import 'package:treecredz_admin/presentation/widgets/small_title.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(18),
            child: SmallTitleWidget(),
          ),
          ShowUp(
            delay: Duration(milliseconds: 100),
            child: Column(
              children: [
                co2Emited(context),
                SizedBox(height: 24),
                co2Traded(context),
                SizedBox(height: 24),
                co2Consumed(context),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget co2Emited(BuildContext ctx) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: ExpansionTile(
        title: Text(
          'CO2 Emmited',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: darkGreen,
          ),
        ),
        subtitle: Text(
          '\nThey cause climate change by trapping heat, and they also contribute to respiratory disease from smog and air pollution. Extreme weather, food supply disruptions, and increased wildfires are other effects of climate change caused by greenhouse gases.',
          style: TextStyle(color: Colors.black),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16),
        tilePadding: EdgeInsets.all(16),
        children: [
          Container(
            child: Image.asset("assets/images/emission_line.png"),
          ),
          SizedBox(height: 16),
          Container(
            child: Image.asset("assets/images/emission_pie.png"),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget co2Traded(BuildContext ctx) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: ExpansionTile(
        title: Text(
          'CO2 Traded',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: darkGreen,
          ),
        ),
        subtitle: Text(
          '\nCarbon emissions trading is a type of policy that allows companies to buy or sell government-granted allotments of carbon dioxide output. The World Bank reports that 40 countries and 20 municipalities use either carbon taxes or carbon emissions trading. That covers 13% of annual global greenhouse gas emissions.',
          style: TextStyle(color: Colors.black),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16),
        tilePadding: EdgeInsets.all(16),
        children: [
          Container(
            child: Image.asset("assets/images/trade_line.png"),
          ),
          SizedBox(height: 16),
          Container(
            child: Image.asset("assets/images/trade_pie.png"),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget co2Consumed(BuildContext ctx) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: ExpansionTile(
        title: Text(
          'CO2 Consumed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: darkGreen,
          ),
        ),
        subtitle: Text(
          '\nTthe amount of carbon dioxide released into the atmosphere as a result of the activities of a particular individual, organization, or community.',
          style: TextStyle(color: Colors.black),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16),
        tilePadding: EdgeInsets.all(16),
        children: [
          Container(
            child: Image.asset("assets/images/consumption_line.png"),
          ),
          SizedBox(height: 16),
          Container(
            child: Image.asset("assets/images/consumption_pie.png"),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
