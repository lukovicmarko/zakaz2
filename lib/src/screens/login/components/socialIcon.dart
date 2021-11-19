import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zakazi/src/constants.dart';

class SocialIcon extends StatelessWidget {
  SocialIcon({required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: kGreySocialIconColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
