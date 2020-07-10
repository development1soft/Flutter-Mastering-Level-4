import 'package:flutter/material.dart';
import 'package:flutter_mastering_level_4/src/home.dart';
import 'package:flutter_mastering_level_4/src/sql_pratice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SqlPraticeScreen(),
    );
  }
  
}


