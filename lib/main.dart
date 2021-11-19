import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zakazi/src/zakazi.dart';

void main() async {
  await dotenv.load();
  runApp(const Zakazi());
}
