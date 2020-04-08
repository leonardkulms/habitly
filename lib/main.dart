import 'package:flutter/material.dart';
import 'package:habitly/dashboard.dart';


void main() => runApp(Habitly());

class Habitly extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Dashboard(),
    );
  }
}
