import 'package:flutter/material.dart';
import 'package:zakazi/src/screens/home/components/body.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Body(),
    );
  }
}
