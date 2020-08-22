import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/volunteer_screens/history_screen.dart';
import 'package:uc_health/screens/volunteer_screens/volunteer_profile_screen.dart';
import 'package:uc_health/screens/volunteer_screens/request_screen.dart';

class VolunteerTabBarScreen extends StatefulWidget {
  static const String id = 'volunteer_tab_bar_screen';
  @override
  _VolunteerTabBarScreenState createState() => _VolunteerTabBarScreenState();
}

class _VolunteerTabBarScreenState extends State<VolunteerTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: kPrimaryColor,
        backgroundColor: kWhite,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Requests'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        assert(index >= 0 && index <= 2);
        switch (index) {
          case 0:
            return RequestScreen();
            break;
          case 1:
            return HistoryScreen();
            break;
          case 2:
            return VolunteerProfileScreen();
            break;
        }
        return null;
      },
    );
  }
}
