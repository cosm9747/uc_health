import 'package:flutter/material.dart';
import 'package:uc_health/components/dropdown_menu_card.dart';
import 'package:uc_health/components/text_field_card.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/patient_screens/categories_screen.dart';

class RoomInfoScreen extends StatefulWidget {
  static const String id = 'room_info_screen';
  @override
  _RoomInfoScreenState createState() => _RoomInfoScreenState();
}

class _RoomInfoScreenState extends State<RoomInfoScreen> {
  String hospital;
  String wing = '';
  String room = '';
  Color wingColor = kWhite;
  Color roomColor = kWhite;
  FocusNode _wingFocusNode = FocusNode();
  FocusNode _roomFocusNode = FocusNode();
  bool isWingFocused = false;
  bool isRoomFocused = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _wingFocusNode.addListener(_wingFocusNodeListener);
    _roomFocusNode.addListener(_roomFocusNodeListener);
  }

  @override
  void dispose() {
    super.dispose();
    _wingFocusNode.removeListener(_wingFocusNodeListener);
    _roomFocusNode.removeListener(_roomFocusNodeListener);
  }

  Future<Null> _wingFocusNodeListener() async {
    if (_wingFocusNode.hasFocus) {
      setState(() {
        isWingFocused = true;
        wingColor = kWhite;
      });
    } else {
      setState(() {
        isWingFocused = false;
        if (wing.length == 0) {
          wingColor = kWhite;
        } else {
          wingColor = kLightGray;
        }
      });
    }
  }

  Future<Null> _roomFocusNodeListener() async {
    if (_roomFocusNode.hasFocus) {
      setState(() {
        isRoomFocused = true;
        roomColor = kWhite;
      });
    } else {
      setState(() {
        isRoomFocused = false;
        if (room.length == 0) {
          roomColor = kWhite;
        } else {
          roomColor = kLightGray;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Room Info'),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            DropdownMenuCard(
              dropdownValue: hospital,
              titleText: 'Hospital',
              onChanged: (newValue) {
                setState(() {
                  hospital = newValue;
                });
              },
              dropdownList: kHospitals,
            ),
            TextFieldCard(
              color: wingColor,
              isFocused: isWingFocused,
              title: 'Wing',
              onChanged: (text) {
                wing = text;
              },
              focusNode: _wingFocusNode,
            ),
            TextFieldCard(
              color: roomColor,
              isFocused: isRoomFocused,
              title: 'Room',
              onChanged: (text) {
                room = text;
              },
              focusNode: _roomFocusNode,
            ),
            Padding(
                padding: const EdgeInsets.all(36.0),
                child: GestureDetector(
                  onTap: () {
                    if (hospital == null ||
                        wing.length == 0 ||
                        room.length == 0) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Please fill out all 3 fields')));
                    } else if (wing.length > 20) {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text('Please enter a valid wing')));
                    } else if (room.length > 10) {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text('Please enter a valid room')));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(
                              hospital: hospital,
                              wing: wing,
                              room: room,
                            ),
                          ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kMedGray,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
