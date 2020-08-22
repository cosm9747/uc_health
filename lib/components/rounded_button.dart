import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, this.title, this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: kWhite,
                fontSize: 20.0,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
