import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';

class UserInfoTextField extends StatelessWidget {
  //text fields for login/signup screens
  UserInfoTextField({
    @required this.onChanged,
    @required this.focusNode,
    @required this.leadingIcon,
    @required this.hintText,
    @required this.trailingIcon,
    @required this.keyboardType,
    @required this.obscureText,
    @required this.borderColor,
  });

  final Function onChanged;
  final FocusNode focusNode;
  final Icon leadingIcon;
  final String hintText;
  final Widget trailingIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: borderColor),
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            leadingIcon,
            SizedBox(width: 4.0),
            Expanded(
              child: TextField(
                obscureText: obscureText,
                keyboardType: keyboardType,
                onChanged: onChanged,
                focusNode: focusNode,
                textCapitalization: keyboardType == TextInputType.text
                    ? TextCapitalization.words
                    : TextCapitalization.none,
                cursorColor: kPrimaryColor,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                ),
              ),
            ),
            trailingIcon,
          ],
        ),
      ),
    );
  }
}
