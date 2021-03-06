import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bin2Dec',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home: HomePage(),
    );
  }
}
