import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/components/bottomNavigationBar.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/data/bottomNavigation.dart';
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
