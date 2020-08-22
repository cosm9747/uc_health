import 'package:flutter/material.dart';
import 'package:uc_health/components/rounded_button.dart';
import 'package:uc_health/components/user_info_text_field.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/volunteer_screens/volunteer_tab_bar_screen.dart';

class VolunteerIdScreen extends StatefulWidget {
  static const String id = 'volunteer_id_screen';

  @override
  _VolunteerIdScreenState createState() => _VolunteerIdScreenState();
}

class _VolunteerIdScreenState extends State<VolunteerIdScreen> {
  FocusNode _idFocusNode = FocusNode();
  String id = '';
  bool isIdFocused = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _idFocusNode.addListener(_idFocusNodeListener);
  }

  @override
  void dispose() {
    super.dispose();
    _idFocusNode.removeListener(_idFocusNodeListener);
  }

  Future<Null> _idFocusNodeListener() async {
    if (_idFocusNode.hasFocus) {
      setState(() {
        isIdFocused = true;
      });
    } else {
      setState(() {
        isIdFocused = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Enter ID'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: SizedBox()),
          UserInfoTextField(
            onChanged: (value) {
              setState(() {
                id = value;
              });
            },
            focusNode: _idFocusNode,
            hintText: 'Volunteer ID',
            obscureText: false,
            keyboardType: TextInputType.number,
            leadingIcon: Icon(Icons.account_circle,
                color: isIdFocused ? kBlack : kMedGray),
            borderColor: isIdFocused ? kPrimaryColor : kMedGray,
            trailingIcon: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: RoundedButton(
              title: 'Continue',
              color: id.length == 0 ? kDisabledMedGray : kMedGray,
              onPressed: id.length == 0
                  ? null
                  : () {
                      if (id.length > 9) {
                        //change later to check if id exists
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text('Invalid id number')));
                        return;
                      }
                      Navigator.pushNamed(context, VolunteerTabBarScreen.id);
                    },
            ),
          ),
          Expanded(child: SizedBox()),
          isIdFocused
              ? Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: kLightGray,
                    width: 0.5,
                  ))),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _idFocusNode.unfocus();
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
