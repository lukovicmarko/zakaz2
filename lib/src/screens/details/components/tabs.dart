import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/data/salonsData.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    final salonsData = Provider.of<SalonsData>(context);

    return SizedBox(
      height: 42.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: salonsData.tabs.length,
        itemBuilder: (context, index) => buildTab(index, salonsData),
      ),
    );
  }

  Widget buildTab(int index, salonsData) {
    return GestureDetector(
      onTap: () {
        salonsData.currentTabIndex = index;
      },
      child: Container(
        decoration: BoxDecoration(
          color: salonsData.selectedTabIndex == index
              ? kTabsColor
              : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(23.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
          child: Center(
            child: Text(
              salonsData.tabs[index],
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: salonsData.selectedTabIndex == index
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: salonsData.selectedTabIndex == index
                    ? Colors.white
                    : kGreyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
