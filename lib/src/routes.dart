import 'package:flutter/widgets.dart';
import 'package:zakazi/src/screens/details/detailsScreen.dart';
import 'package:zakazi/src/screens/home/home_screen.dart';
import 'package:zakazi/src/screens/login/loginScreen.dart';
import 'package:zakazi/src/screens/mainScreen.dart';
import 'package:zakazi/src/screens/register/registerScreen.dart';

import 'screens/search/searchScreen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};
