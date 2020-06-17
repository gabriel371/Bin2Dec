import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final Function(int) onValueSwitch;

  SwitchButton({this.onValueSwitch});

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  int value = 0;

  void switchValue() {
    if (value == 0) {
      setState(() {
        value = 1;
      });
    } else {
      setState(() {
        value = 0;
      });
    }
    widget.onValueSwitch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(7.5),
        height: 30,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).accentColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: FlatButton(
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => switchValue(),
        ),
      ),
    );
  }
}
