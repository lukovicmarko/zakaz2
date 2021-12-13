import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/constants.dart';

import '../../../data/categoriesData.dart';
import '../../../data/salonsData.dart';
import '../../../models/Category.dart';

class Body extends StatelessWidget {
  const Body({Key? key, this.index}) : super(key: key);

  final int? index;

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoriesData>(context);
    final salonsData = Provider.of<SalonsData>(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Categories(
              categories: categoriesData.categories,
              selectedIndex: index,
            ),
            SizedBox(height: 20.h),
            Text(
              'Results found (${salonsData.salons.length})',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: ListView(
                children: [Text('marko'), Text('marko')],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Categories extends StatefulWidget {
  Categories({Key? key, required this.categories, this.selectedIndex})
      : super(key: key);
  final List<Category> categories;
  int? selectedIndex;

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final salonsData = Provider.of<SalonsData>(context);
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) =>
            buildCategory(index, salonsData, widget.categories[index].id),
      ),
    );
  }

  Widget buildCategory(int index, salonsData, String id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedIndex = index;

          // salonsData.getSalonsByCategoryId(id);
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 25.w),
        child: Column(
          children: [
            Text(
              widget.categories[index].name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color:
                    widget.selectedIndex == index ? Colors.black : kGreyColor,
              ),
            ),
            Container(
              height: 2,
              width: 15.w,
              margin: EdgeInsets.only(top: 8.w),
              decoration: BoxDecoration(
                color: widget.selectedIndex == index
                    ? kButtonColor
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
