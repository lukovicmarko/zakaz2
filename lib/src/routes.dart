import 'package:flutter/widgets.dart';
import 'package:zakazi/src/screens/details/detailsScreen.dart';
import 'package:zakazi/src/screens/home/home_screen.dart';
import 'package:zakazi/src/screens/login/loginScreen.dart';
import 'package:zakazi/src/screens/mainScreen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};
