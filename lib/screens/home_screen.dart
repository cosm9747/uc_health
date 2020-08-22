import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uc_health/components/rounded_button.dart';
import 'package:uc_health/screens/admin_screens/admin_login_screen.dart';
import 'package:uc_health/screens/patient_screens/room_info_screen.dart';
import 'package:uc_health/screens/volunteer_screens/volunteer_id_screen.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String spanish;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int $ntilde = 0x00F1;
    spanish = 'Espa' + String.fromCharCode($ntilde) + 'ol';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Welcome To UCHealth',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            RoundedButton(
              title: 'Volunteer',
              color: kPrimaryColor,
              onPressed: () {
                Navigator.pushNamed(context, VolunteerIdScreen.id);
              },
            ),
            RoundedButton(
              title: 'Administrator',
              color: kDarkGray,
              onPressed: () {
                Navigator.pushNamed(context, AdminLoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Patient/Visitor',
              color: kMedGray,
              onPressed: () {
                Navigator.pushNamed(context, RoomInfoScreen.id);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('English'),
                  Icon(Icons.mic),
                  Text(spanish),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
