import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/components/bottomNavigationBar.dart';
import 'package:zakazi/src/data/bottomNavigation.dart';

// ignore: use_key_in_widget_constructors
class MainScreen extends StatelessWidget {
  static String routeName = '/main';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigation>(context);
    return Scaffold(
      body: provider.currentTab[provider.selectedIndex],
      bottomNavigationBar: buildBottomNavigation(provider),
    );
  }
}
