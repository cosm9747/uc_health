import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uc_health/components/rounded_button.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/patient_screens/more_info_screen.dart';
import 'package:uc_health/screens/patient_screens/subcategories_screen.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({this.hospital, this.wing, this.room});

  final String hospital;
  final String wing;
  final String room;
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> categories = [];
  @override
  void initState() {
    super.initState();
    kRequests.forEach((k, v) => categories.add(k));
  }

  Function onPressed(int index) {
    return () {
      if (categories[index] == 'Visitation') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoreInfoScreen(
                hospital: widget.hospital,
                wing: widget.wing,
                room: widget.room,
                category: categories[index],
                subcategory: '',
              ),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubcategoriesScreen(
                hospital: widget.hospital,
                wing: widget.wing,
                room: widget.room,
                category: categories[index],
              ),
            ));
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Pick a category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CategoryWidget(
                    categories: categories,
                    index: 0,
                    onPressed: onPressed(0),
                  ),
                  CategoryWidget(
                    categories: categories,
                    index: 1,
                    onPressed: onPressed(1),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CategoryWidget(
                    categories: categories,
                    index: 2,
                    onPressed: onPressed(2),
                  ),
                  CategoryWidget(
                    categories: categories,
                    index: 3,
                    onPressed: onPressed(3),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CategoryWidget(
                    categories: categories,
                    index: 4,
                    onPressed: onPressed(4),
                  ),
                  CategoryWidget(
                    categories: categories,
                    index: 5,
                    onPressed: onPressed(5),
                  ),
                ],
              ),
              RoundedButton(
                color: kPrimaryColor,
                title: 'Other',
                onPressed: () {
                  String cat = '';
                  Alert(
                      context: context,
                      title: 'What would you like?',
                      content: Container(
                        color: kWhite,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            onChanged: (text) {
                              cat = text;
                            },
                            cursorColor: kPrimaryColor,
                            style: TextStyle(color: kBlack),
                            decoration: InputDecoration(
                              hintText: 'Other',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      buttons: [
                        DialogButton(
                          color: kRed,
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: kWhite, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          width: 120,
                        ),
                        DialogButton(
                          color: kMedGray,
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            if (cat.length == 0) {
                              Flushbar(
                                message: 'Enter something',
                                duration: Duration(seconds: 2),
                              )..show(context);
                              return;
                            }
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoreInfoScreen(
                                    hospital: widget.hospital,
                                    wing: widget.wing,
                                    room: widget.room,
                                    category: cat,
                                    subcategory: '',
                                  ),
                                ));
                          },
                          width: 120,
                        ),
                      ]).show();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({this.categories, this.index, this.onPressed});

  final List<String> categories;
  final int index;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 2,
                  )),
              child: Image.asset(
                kImages[index],
                width: 100,
                height: 100,
              ),
            ),
          ),
          Text(categories[index]),
        ],
      ),
    );
  }
}
