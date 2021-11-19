import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/constants.dart';

class SectionHeader extends StatelessWidget {
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  SectionHeader({
    required this.textTitle,
    required this.textTitleSubtitle,
  });

  final String textTitle;
  final String textTitleSubtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          textTitleSubtitle,
          style: TextStyle(
            color: kGreyTextColor,
            fontSize: 13.sp,
          ),
        )
      ],
    );
  }
}
