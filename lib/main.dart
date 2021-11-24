import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakazi/src/zakazi.dart';

String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("token");

  runApp(Zakazi(token: token));
}
