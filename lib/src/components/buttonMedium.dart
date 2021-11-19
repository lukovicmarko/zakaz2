import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class ButtonMedium extends StatelessWidget {
  ButtonMedium({required this.name, required this.onPress});

  final String name;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 58.h,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
