import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';

class TextFieldCard extends StatelessWidget {
  TextFieldCard(
      {this.color,
      this.isFocused,
      this.title,
      this.onChanged,
      this.focusNode,
      this.controller,
      this.maxLength});

  final Color color;
  final bool isFocused;
  final String title;
  final Function onChanged;
  final FocusNode focusNode;
  final TextEditingController controller;
  final int maxLength;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isFocused ? kPrimaryColor : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title),
              SizedBox(height: 4.0),
              TextField(
                controller: controller,
                onChanged: onChanged,
                focusNode: focusNode,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration.collapsed(hintText: null),
                maxLength: maxLength,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
