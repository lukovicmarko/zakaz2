import 'package:flutter/material.dart';

import 'components/body.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  static String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
