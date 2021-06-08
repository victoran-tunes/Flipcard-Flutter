import 'package:trabalhocard/views/views.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class App extends StatefulWidget {


  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho FlipCard',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
