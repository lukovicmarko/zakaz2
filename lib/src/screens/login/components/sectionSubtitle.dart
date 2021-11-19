import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/constants.dart';

class SetctionSubTitle extends StatelessWidget {
  SetctionSubTitle({required this.subTitle});

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(fontSize: 15.sp, color: kLoginGreyColor),
    );
  }
}
