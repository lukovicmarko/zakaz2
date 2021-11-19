import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/data/categoriesData.dart';
import 'categoryCard.dart';

// ignore: use_key_in_widget_constructors
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesData>(
      // ignore: sized_box_for_whitespace
      builder: (context, categories, child) => Container(
        height: 135.h,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 15.w);
          },
          itemCount: categories.categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            return CategoryCard(category: categories.categories[index]);
          },
        ),
      ),
    );
  }
}
