import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/home_screen.dart';

class VolunteerProfileScreen extends StatefulWidget {
  @override
  _VolunteerProfileScreenState createState() => _VolunteerProfileScreenState();
}

class _VolunteerProfileScreenState extends State<VolunteerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text(
          'Profile',
          style: TextStyle(color: kBlack),
        ),
        brightness: Brightness.light,
        elevation: 1,
      ),
      body: Center(
          child: FlatButton(
        child: Text('Log out'),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.id, (Route<dynamic> route) => false);
        },
      )),
    );
  }
}
