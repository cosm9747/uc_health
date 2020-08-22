import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uc_health/screens/admin_screens/admin_login_screen.dart';
import 'package:uc_health/screens/admin_screens/admin_tab_bar_screen.dart';
import 'package:uc_health/screens/home_screen.dart';
import 'package:uc_health/screens/patient_screens/room_info_screen.dart';
import 'package:uc_health/screens/volunteer_screens/volunteer_id_screen.dart';
import 'package:uc_health/screens/volunteer_screens/volunteer_tab_bar_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        RoomInfoScreen.id: (context) => RoomInfoScreen(),
        AdminLoginScreen.id: (context) => AdminLoginScreen(),
        VolunteerIdScreen.id: (context) => VolunteerIdScreen(),
        VolunteerTabBarScreen.id: (context) => VolunteerTabBarScreen(),
        AdminTabBarScreen.id: (context) => AdminTabBarScreen(),
      },
    );
  }
}
