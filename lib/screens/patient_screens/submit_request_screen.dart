import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uc_health/components/rounded_button.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/home_screen.dart';
import 'package:uc_health/screens/patient_screens/edit_request_screen.dart';

class SubmitRequestScreen extends StatefulWidget {
  SubmitRequestScreen(
      {this.hospital,
      this.wing,
      this.room,
      this.category,
      this.subcategory,
      this.moreInfo});

  final String hospital;
  final String wing;
  final String room;
  final String category;
  final String subcategory;
  final String moreInfo;

  @override
  _SubmitRequestScreenState createState() => _SubmitRequestScreenState();
}

class _SubmitRequestScreenState extends State<SubmitRequestScreen> {
  String hospital;
  String wing;
  String room;
  String category;
  String subcategory;
  String moreInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hospital = widget.hospital;
    wing = widget.wing;
    room = widget.room;
    category = widget.category;
    subcategory = widget.subcategory;
    moreInfo = widget.moreInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Submit Request'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Details(titleText: 'Hospital', detailsText: hospital),
                      Details(titleText: 'Wing', detailsText: wing),
                      Details(titleText: 'Room', detailsText: room),
                      Details(titleText: 'Category', detailsText: category),
                      subcategory != null && subcategory.length > 0
                          ? Details(
                              titleText: 'Subcategory',
                              detailsText: subcategory)
                          : SizedBox(),
                      moreInfo != null && moreInfo.length > 0
                          ? Details(
                              titleText: 'Additional Information',
                              detailsText: moreInfo)
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RoundedButton(
                    color: kMedGray,
                    title: 'Edit',
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditRequestScreen(
                              hospital: hospital,
                              wing: wing,
                              room: room,
                              category: category,
                              subcategory: subcategory,
                              moreInfo: moreInfo,
                            ),
                          ));
                      if (result == null) {
                        return;
                        //if back button is pressed instead of apply
                      }
                      setState(() {
                        try {
                          hospital = result['hospital'];
                          wing = result['wing'];
                          room = result['room'];
                          category = result['category'];
                          subcategory = result['subcategory'];
                          moreInfo = result['moreInfo'];
                        } catch (e) {
                          print(e);
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RoundedButton(
                    color: kLightOrange,
                    title: 'Submit',
                    onPressed: () async {
                      await Alert(
                          title: 'Successfully Submitted',
                          context: context,
                          buttons: [
                            DialogButton(
                              child: Text('OK'),
                              color: kLightGray,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ]).show();
                      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  Details({this.titleText, this.detailsText});

  final String titleText;
  final String detailsText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RichText(
        text: TextSpan(
          text: '$titleText:',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w500,
            fontSize: 20,
//            decoration: TextDecoration.underline,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' $detailsText',
              style: TextStyle(
                fontWeight: FontWeight.normal,
//                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
