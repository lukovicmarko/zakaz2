import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/models/Specialist.dart';

class SpecialistsCard extends StatelessWidget {
  const SpecialistsCard({Key? key, required this.specialist}) : super(key: key);

  final Specialist specialist;

  @override
  Widget build(BuildContext context) {
    var parts = specialist.name.split(' ');
    var name = parts[0];
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(specialist.image),
        ),
        SizedBox(height: 9.h),
        // ignore: prefer_const_constructors
        Text(name),
      ],
    );
  }
}
