// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/data/salonsData.dart';
import 'package:zakazi/src/screens/home/components/sectionHeader.dart';

import '../../../data/auth.dart';

import 'categories.dart';
import 'nearestSalons.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<AuthData>(context);
    final salonData = Provider.of<SalonsData>(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 45.h),
        child: userData.isLogged
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        userData.user.image,
                        width: 40.w,
                        height: 40.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 40.h,
                            padding: const EdgeInsets.all(11.0),
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1, color: kGreyColor),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/stroke/bell.svg",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            width: 40.w,
                            height: 40.h,
                            padding: const EdgeInsets.all(11.0),
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1, color: kGreyColor),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/stroke/Search(stroke).svg",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.w),
                    child: Text(
                      "Hi, ${userData.user.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/stroke/Map-pin(stroke).svg",
                        color: kGreyIconColor,
                      ),
                      SizedBox(width: 7.h),
                      Text(
                        '${salonData.locationAddress}',
                        style: TextStyle(
                          color: kGreyTextColor,
                          fontSize: 13.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  // SectionHeader(textTitle: "Appointment", textTitleSubtitle: "Today"),
                  SectionHeader(
                    textTitle: "Services",
                    textTitleSubtitle: "",
                  ),
                  SizedBox(height: 15.h),
                  Categories(),
                  SizedBox(height: 25.h),
                  SectionHeader(
                    textTitle: "Nearest salon",
                    textTitleSubtitle: "View All",
                  ),
                  SizedBox(height: 15.h),
                  NearestSalons(),
                ],
              )
            : const Center(child: Text("Loading")),
      ),
    );
  }
}
