import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/Salon.dart';

class AboutSalon extends StatelessWidget {
  const AboutSalon({Key? key, required this.salon}) : super(key: key);

  final Salon salon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Column(
        children: [
          Text(salon.description),
        ],
      ),
    );
  }
}
