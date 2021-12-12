import 'package:flutter/material.dart';

import 'components/body.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  static String routeName = '/register';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
