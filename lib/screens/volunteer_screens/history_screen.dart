import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text(
          'History',
          style: TextStyle(color: kBlack),
        ),
        brightness: Brightness.light,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'No history yet',
          style: TextStyle(
            color: kMedGray,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
