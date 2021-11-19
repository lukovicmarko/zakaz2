import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/data/bottomNavigation.dart';

BottomNavigationBar buildBottomNavigation(BottomNavigation provider) {
  return BottomNavigationBar(
    onTap: (int index) {
      provider.currentIndex = index;
    },
    currentIndex: provider.selectedIndex,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedFontSize: 0,
    elevation: 0,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/stroke/Home(stroke).svg",
          width: 20.0.w,
          height: 20.0.h,
          color: kInactiveIconColor,
        ),
        label: "",
        activeIcon: SvgPicture.asset(
          "assets/icons/stroke/Home(stroke).svg",
          width: 20.0.w,
          height: 20.0.h,
          color: kActiveIconColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/stroke/Location(stroke).svg",
          width: 20.0.w,
          height: 20.0.h,
          color: kInactiveIconColor,
        ),
        label: "",
        activeIcon: SvgPicture.asset(
          "assets/icons/stroke/Location(stroke).svg",
          width: 20.0,
          height: 20.0,
          color: kActiveIconColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/stroke/Calendar(stroke).svg",
          width: 20.w,
          height: 20.h,
          color: kInactiveIconColor,
        ),
        label: "",
        // title: Container(),
        activeIcon: SvgPicture.asset(
          "assets/icons/stroke/Calendar(stroke).svg",
          width: 20.w,
          height: 20.h,
          color: kActiveIconColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/stroke/Heart(stroke).svg",
          width: 20.w,
          height: 20.h,
          color: kInactiveIconColor,
        ),
        label: "",
        // title: Container(),
        activeIcon: SvgPicture.asset(
          "assets/icons/stroke/Heart(stroke).svg",
          width: 20.w,
          height: 20.h,
          color: kActiveIconColor,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/icons/stroke/User(stroke).svg",
          width: 20.w,
          height: 20.h,
          color: kInactiveIconColor,
        ),
        label: "",
        // title: Container(),
        activeIcon: SvgPicture.asset(
          "assets/icons/stroke/User(stroke).svg",
          width: 20.w,
          height: 20.h,
          color: kActiveIconColor,
        ),
      ),
    ],
  );
}
