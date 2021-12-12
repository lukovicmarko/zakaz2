import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistsCard extends StatelessWidget {
  const SpecialistsCard({Key? key, required this.image, required this.name})
      : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(height: 9.h),
        // ignore: prefer_const_constructors
        Text(name),
      ],
    );
  }
}
