import 'package:flutter/material.dart';
import 'package:uc_health/components/rounded_button.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/patient_screens/submit_request_screen.dart';

class MoreInfoScreen extends StatefulWidget {
  MoreInfoScreen(
      {this.hospital, this.wing, this.room, this.category, this.subcategory});

  final String hospital;
  final String wing;
  final String room;
  final String category;
  final String subcategory;
  @override
  _MoreInfoScreenState createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  String moreInfo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Info'),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              color: kWhite,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (text) {
                    moreInfo = text;
                  },
                  cursorColor: kPrimaryColor,
                  style: TextStyle(color: kBlack),
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Additional Info (optional)',
                  ),
                  maxLength: 150,
                ),
              ),
            ),
            RoundedButton(
              color: kMedGray,
              title: 'Continue',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubmitRequestScreen(
                        hospital: widget.hospital,
                        wing: widget.wing,
                        room: widget.room,
                        category: widget.category,
                        subcategory: widget.subcategory,
                        moreInfo: moreInfo,
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
