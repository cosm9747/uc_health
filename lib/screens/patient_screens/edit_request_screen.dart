import 'package:flutter/material.dart';
import 'package:uc_health/components/dropdown_menu_card.dart';
import 'package:uc_health/components/rounded_button.dart';
import 'package:uc_health/components/text_field_card.dart';
import 'package:uc_health/constants.dart';

class EditRequestScreen extends StatefulWidget {
  EditRequestScreen(
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
  _EditRequestScreenState createState() => _EditRequestScreenState();
}

class _EditRequestScreenState extends State<EditRequestScreen> {
  String hospital;
  String wing;
  String room;
  String category;
  String subcategory;
  String moreInfo;

  List<String> categories = [];

  Color wingColor = kWhite;
  Color roomColor = kWhite;
  Color moreInfoColor = kWhite;
  FocusNode _wingFocusNode = FocusNode();
  FocusNode _roomFocusNode = FocusNode();
  FocusNode _moreInfoFocusNode = FocusNode();
  TextEditingController _wingController = TextEditingController();
  TextEditingController _roomController = TextEditingController();
  TextEditingController _moreInfoController = TextEditingController();
  bool isWingFocused = false;
  bool isRoomFocused = false;
  bool isMoreInfoFocused = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _wingFocusNode.addListener(_wingFocusNodeListener);
    _roomFocusNode.addListener(_roomFocusNodeListener);
    _moreInfoFocusNode.addListener(_moreInfoFocusNodeListener);

    hospital = widget.hospital;
    wing = widget.wing;
    room = widget.room;
    category = widget.category;
    subcategory = widget.subcategory;
    moreInfo = widget.moreInfo;

    _wingController.text = wing;
    _roomController.text = room;
    _moreInfoController.text = moreInfo;

    wing.length > 0 ? wingColor = kLightGray : wingColor = kWhite;
    room.length > 0 ? roomColor = kLightGray : roomColor = kWhite;
    moreInfo.length > 0 ? moreInfoColor = kLightGray : moreInfoColor = kWhite;

    kRequests.forEach((k, v) => categories.add(k));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _wingFocusNode.removeListener(_wingFocusNodeListener);
    _roomFocusNode.removeListener(_roomFocusNodeListener);
    _moreInfoFocusNode.removeListener(_moreInfoFocusNodeListener);
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

  Future<Null> _moreInfoFocusNodeListener() async {
    if (_moreInfoFocusNode.hasFocus) {
      setState(() {
        isMoreInfoFocused = true;
        moreInfoColor = kWhite;
      });
    } else {
      setState(() {
        isMoreInfoFocused = false;
        if (moreInfo.length == 0) {
          moreInfoColor = kWhite;
        } else {
          moreInfoColor = kLightGray;
        }
      });
    }
  }

  Widget getSubcategory() {
    if (!kRequests.containsKey(category) || category == 'Visitation') {
      return SizedBox();
    }
    List<String> subcategories = kRequests[category];
    return DropdownMenuCard(
      dropdownValue: subcategory,
      titleText: 'Subcategory',
      onChanged: (newValue) {
        setState(() {
          subcategory = newValue;
        });
      },
      dropdownList: subcategories,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Edit Request'),
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
              controller: _wingController,
              color: wingColor,
              isFocused: isWingFocused,
              title: 'Wing',
              onChanged: (text) {
                wing = text;
              },
              focusNode: _wingFocusNode,
            ),
            TextFieldCard(
              controller: _roomController,
              color: roomColor,
              isFocused: isRoomFocused,
              title: 'Room',
              onChanged: (text) {
                room = text;
              },
              focusNode: _roomFocusNode,
            ),
            DropdownMenuCard(
              //fix this for "other" category
              dropdownValue: categories.contains(category) ? category : null,
              titleText: 'Category',
              onChanged: (newValue) {
                setState(() {
                  category = newValue;

                  subcategory = null;
                });
              },
              dropdownList: categories,
            ),
            getSubcategory(),
            TextFieldCard(
              controller: _moreInfoController,
              color: moreInfoColor,
              isFocused: isMoreInfoFocused,
              title: 'Additional Info',
              onChanged: (text) {
                moreInfo = text;
              },
              focusNode: _moreInfoFocusNode,
              maxLength: 150,
            ),
            RoundedButton(
              color: kMedGray,
              title: 'Apply',
              onPressed: () {
                if (wing.length == 0) {
                  _scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text('Enter a wing')));
                } else if (room.length == 0) {
                  //finish these
                } else if (kRequests.containsKey(category) &&
                    category == 'Visitation' &&
                    subcategory == null) {
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text('Pick a subcategory')));
                }
                Map<String, dynamic> editedRequest = {
                  'hospital': hospital,
                  'wing': wing,
                  'room': room,
                  'category': category,
                  'subcategory': subcategory,
                  'moreInfo': moreInfo,
                };
                Navigator.of(context).pop(editedRequest);
              },
            )
          ],
        ),
      ),
    );
  }
}
