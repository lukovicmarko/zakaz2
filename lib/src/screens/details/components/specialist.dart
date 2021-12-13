import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/models/Specialist.dart';
import 'package:zakazi/src/screens/details/components/specialistsCard.dart';

class Specialists extends StatelessWidget {
  const Specialists({Key? key, required this.specialists}) : super(key: key);
  final List<Specialist> specialists;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 20.w);
        },
        itemCount: specialists.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return SpecialistsCard(
            specialist: specialists[index],
          );
        },
      ),
    );
  }
}
