import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/admin_screens/add_volunteer_screen.dart';

class VolunteerScreen extends StatefulWidget {
  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.downToUp,
                  child: AddVolunteerScreen()));
        },
      ),
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text(
          'Volunteers',
          style: TextStyle(color: kBlack),
        ),
        brightness: Brightness.light,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'No volunteers registered',
          style: TextStyle(
            color: kMedGray,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
