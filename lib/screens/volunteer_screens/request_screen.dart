import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text(
          'Requests',
          style: TextStyle(color: kBlack),
        ),
        brightness: Brightness.light,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'There are no active requests',
          style: TextStyle(
            color: kMedGray,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
