import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/admin_screens/activity_screen.dart';
import 'package:uc_health/screens/admin_screens/admin_profile_screen.dart';
import 'package:uc_health/screens/admin_screens/volunteer_screen.dart';

class AdminTabBarScreen extends StatefulWidget {
  static const String id = 'admin_tab_bar_screen';
  @override
  _AdminTabBarScreenState createState() => _AdminTabBarScreenState();
}

class _AdminTabBarScreenState extends State<AdminTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: kPrimaryColor,
        backgroundColor: kWhite,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Volunteers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Activity'),
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
            return VolunteerScreen();
            break;
          case 1:
            return ActivityScreen();
            break;
          case 2:
            return AdminProfileScreen();
            break;
        }
        return null;
      },
    );
  }
}
