import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/models/Category.dart';

class CategoryCard extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 90.w,
          height: 92.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              category.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          category.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
