import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'switch_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables for each button
  var _v1 = 0;
  var _v2 = 0;
  var _v3 = 0;
  var _v4 = 0;
  var _v5 = 0;
  var _v6 = 0;
  var _v7 = 0;
  var _v8 = 0;

  @override
  Widget build(BuildContext context) {
    var _dec = int.parse('$_v1$_v2$_v3$_v4$_v5$_v6$_v7$_v8', radix: 2);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bin2Dec',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Icon(
              FontAwesome5.exchange_alt,
              color: Colors.grey,
              size: 120,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text('Press buttons below to switch binary digits (0-1)'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Flex(
            direction: Axis.horizontal,
            children: [
              SwitchButton(onValueSwitch: (v1) => setState(() => _v1 = v1)),
              SwitchButton(onValueSwitch: (v2) => setState(() => _v2 = v2)),
              SwitchButton(onValueSwitch: (v3) => setState(() => _v3 = v3)),
              SwitchButton(onValueSwitch: (v4) => setState(() => _v4 = v4)),
              SwitchButton(onValueSwitch: (v5) => setState(() => _v5 = v5)),
              SwitchButton(onValueSwitch: (v6) => setState(() => _v6 = v6)),
              SwitchButton(onValueSwitch: (v7) => setState(() => _v7 = v7)),
              SwitchButton(onValueSwitch: (v8) => setState(() => _v8 = v8)),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.075),
          Text(
            'Decimal:',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Builder(
            builder: (ctx) => Center(
              child: GestureDetector(
                child: Container(
                  height: 90,
                  width: 75,
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
                  child: Center(
                    child: Text(
                      (_dec != null) ? _dec.toString() : 'Nothing',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: _dec.toString()));
                  Scaffold.of(ctx).showSnackBar(
                    SnackBar(
                      content: Text('Decimal ${_dec.toString()} copied to Clipboard'),
                      duration: Duration(milliseconds: 2500),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
