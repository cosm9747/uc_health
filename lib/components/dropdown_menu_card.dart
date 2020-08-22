import 'package:flutter/material.dart';
import 'package:uc_health/constants.dart';

class DropdownMenuCard extends StatelessWidget {
  DropdownMenuCard(
      {this.dropdownValue, this.titleText, this.onChanged, this.dropdownList});

  final String dropdownValue;
  final String titleText;
  final Function onChanged;
  final List<String> dropdownList;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: dropdownValue == null ? kWhite : kLightGray,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            dropdownValue == null ? SizedBox() : Text(titleText),
            Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(titleText),
                      value: dropdownValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      onChanged: onChanged,
                      items: dropdownList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
