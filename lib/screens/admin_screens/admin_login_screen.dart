import 'package:flutter/material.dart';
import 'package:uc_health/components/rounded_button.dart';
import 'package:uc_health/components/user_info_text_field.dart';
import 'package:uc_health/constants.dart';
import 'package:uc_health/screens/admin_screens/admin_tab_bar_screen.dart';

class AdminLoginScreen extends StatefulWidget {
  static const String id = 'admin_login_screen';
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  String email = '';
  String password = '';
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isPasswordVisible = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_emailFocusNodeListener);
    _passwordFocusNode.addListener(_passwordFocusNodeListener);
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.removeListener(_emailFocusNodeListener);
    _passwordFocusNode.removeListener(_passwordFocusNodeListener);
  }

  Future<Null> _emailFocusNodeListener() async {
    if (_emailFocusNode.hasFocus) {
      setState(() {
        isEmailFocused = true;
      });
    } else {
      setState(() {
        isEmailFocused = false;
      });
    }
  }

  Future<Null> _passwordFocusNodeListener() async {
    if (_passwordFocusNode.hasFocus) {
      setState(() {
        isPasswordFocused = true;
      });
    } else {
      setState(() {
        isPasswordFocused = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Log In'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            UserInfoTextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              focusNode: _emailFocusNode,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              leadingIcon:
                  Icon(Icons.email, color: isEmailFocused ? kBlack : kMedGray),
              borderColor: isEmailFocused ? kPrimaryColor : kMedGray,
              trailingIcon: SizedBox(),
            ),
            UserInfoTextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              focusNode: _passwordFocusNode,
              hintText: 'Password',
              keyboardType: TextInputType.text,
              obscureText: !isPasswordVisible,
              leadingIcon: Icon(Icons.lock,
                  color: isPasswordFocused ? kBlack : kMedGray),
              borderColor: isPasswordFocused ? kPrimaryColor : kMedGray,
              trailingIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: RoundedButton(
                title: 'Login',
                color: email.length == 0 || password.length == 0
                    ? kDisabledMedGray
                    : kMedGray,
                onPressed: email.length == 0 || password.length == 0
                    ? null
                    : () {
                        if (!email.contains('@uchealth.org')) {
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text('Enter employee email')));
                          return;
                        } else if (password.length < 6) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                  'Password must be at least 6 characters')));
                          return;
                        }
                        Navigator.pushNamed(context, AdminTabBarScreen.id);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
