import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text(
          'Activity',
          style: TextStyle(color: kBlack),
        ),
        brightness: Brightness.light,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'No current activity',
          style: TextStyle(
            color: kMedGray,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
