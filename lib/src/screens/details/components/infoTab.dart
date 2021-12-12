import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final String icon;
  final String name;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 20.h,
            width: 20.w,
          ),
          SizedBox(height: 8.h),
          Text(name)
        ],
      ),
    );
  }
}
