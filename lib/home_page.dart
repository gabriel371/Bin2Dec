import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _dec = 0;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        _dec = int.parse(_controller.text, radix: 2);
      });
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    });

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Bin2Dec'),
        centerTitle: true,
        elevation: 6,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Icon(
              FontAwesome5.exchange_alt,
              color: Colors.grey,
              size: 120,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              maxLength: 8,
              maxLines: 1,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp('[0-1]'))
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Text(
              _dec != null ? _dec.toString() : 'nada',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
