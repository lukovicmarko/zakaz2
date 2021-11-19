import 'package:flutter/material.dart';
import 'package:zakazi/src/screens/appointments/appointmentScreen.dart';
import 'package:zakazi/src/screens/favorites/favoriesScreen.dart';
import 'package:zakazi/src/screens/home/home_screen.dart';
import 'package:zakazi/src/screens/location/locationScreen.dart';
import 'package:zakazi/src/screens/profile/profileScreen.dart';

class BottomNavigation with ChangeNotifier {
  int _selectedIndex = 0;

  final currentTab = [
    HomeScreen(),
    LocationScreen(),
    AppointmentScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  set currentIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  get selectedIndex => _selectedIndex;
}
