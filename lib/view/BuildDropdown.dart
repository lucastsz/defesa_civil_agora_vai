import 'package:flutter/material.dart';

class BuildDropdown extends StatefulWidget {
  final ValueChanged<String> onChanged;
  String defaultValue, selectedValue;
  List<String> itemsList;

  BuildDropdown({Key key, this.itemsList, this.defaultValue, this.onChanged})
      : super(key: key);

  @override
  _BuildDropdownState createState() => _BuildDropdownState();
}

class _BuildDropdownState extends State<BuildDropdown> {
  double sizeTextHeaderSet(context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.0115;
    double customSize = 2.5;
    return customSize * unitHeightValue;
  }

  String _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .037,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: DropdownButton<String>(
        items: widget.itemsList.map(
          (String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
              ),
            );
          },
        ).toList(),
        value: _value == null ? widget.defaultValue : _value,
        isExpanded: true,
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
          widget.onChanged(value);
        },
        style: TextStyle(
          fontSize: sizeTextHeaderSet(context) * .8,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        iconEnabledColor: Color.fromRGBO(203, 79, 36, 1),
        iconSize: 30,
        underline: Container(),
      ),
    );
  }
}
