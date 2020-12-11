import 'package:flutter/material.dart';

import 'package:Finances/views/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finances',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber[300],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Ubuntu'),
      home: MyHomePage(),
    );
  }
}
