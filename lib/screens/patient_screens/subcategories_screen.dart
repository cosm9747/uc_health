import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/patient_screens/more_info_screen.dart';

class SubcategoriesScreen extends StatefulWidget {
  SubcategoriesScreen({this.hospital, this.wing, this.room, this.category});

  final String hospital;
  final String wing;
  final String room;
  final String category;

  @override
  _SubcategoriesScreenState createState() => _SubcategoriesScreenState();
}

class _SubcategoriesScreenState extends State<SubcategoriesScreen> {
  List<String> subcategories = [];

  @override
  void initState() {
    super.initState();
    subcategories = kRequests[widget.category];
  }

  Function onPressed(int index) {
    return () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoreInfoScreen(
              hospital: widget.hospital,
              wing: widget.wing,
              room: widget.room,
              category: widget.category,
              subcategory: subcategories[index],
            ),
          ));
    };
  }

  List<Widget> widgets() {
    List<Widget> subcategoryWidgets = [];
    for (int i = 0; i < subcategories.length; i++) {
      if (i < subcategories.length - 1) {
        Widget temp = Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SubcategoryWidget(
              onPressed: onPressed(i),
              subcategory: subcategories[i],
            ),
            SubcategoryWidget(
              onPressed: onPressed(i + 1),
              subcategory: subcategories[i + 1],
            ),
          ],
        );
        subcategoryWidgets.add(temp);
        i++;
      } else {
        Widget temp = SubcategoryWidget(
          onPressed: onPressed(i),
          subcategory: subcategories[i],
        );
        subcategoryWidgets.add(temp);
      }
    }
    return subcategoryWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('What Kind?'),
          backgroundColor: kPrimaryColor,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: widgets(),
          ),
        ));
  }
}

class SubcategoryWidget extends StatelessWidget {
  SubcategoryWidget({this.onPressed, this.subcategory});

  final Function onPressed;
  final String subcategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryColor,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    subcategory,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      color: kWhite,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
