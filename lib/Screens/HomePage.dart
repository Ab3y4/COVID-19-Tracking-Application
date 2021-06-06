import 'package:api_app/Tabs/homeTab.dart';
import 'package:api_app/Tabs/placesTab.dart';
import 'package:api_app/Tabs/profileTab.dart';
import 'package:api_app/Tabs/qrTab.dart';
import 'package:api_app/Widgets/bottom_tab.dart';
import 'package:api_app/Tabs/homeTab.dart';
import 'package:api_app/Tabs/profileTab.dart';
import 'package:api_app/Tabs/qrTab.dart';
import 'package:api_app/Widgets/bottom_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _tabsPageController;
  int tab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  tab = num;
                });
              },
              children: [
                HomeTab(),
                PlacesTab(),
                QrTab(),
                ProfileTab()
              ],
            ),
          ),
          BottomTabs(
            selectedTab: tab,
            tabPress: (num){
              _tabsPageController.animateToPage(num,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic);
            },
          ),
        ],
      ),
    );
  }
}
