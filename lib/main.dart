import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zakazi/src/data/auth.dart';
import 'package:zakazi/src/zakazi.dart';

void main() async {
  await dotenv.load();

  final authData = AuthData();
  final token = await authData.getLocalStorage();

  runApp(Zakazi(token: token));
}
