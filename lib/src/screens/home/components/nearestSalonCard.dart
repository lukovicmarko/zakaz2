import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/models/Salon.dart';

class NearestSalonCard extends StatelessWidget {
  const NearestSalonCard({Key? key, required this.salon, required this.press})
      : super(key: key);
  final Salon salon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Hero(
        tag: salon.name,
        child: Column(
          children: [
            SizedBox(
              width: 318.w,
              height: 112.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  salon.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 318.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            salon.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SvgPicture.asset("assets/icons/solid/rating4stars.svg")
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            salon.address,
                            style: TextStyle(
                              color: kGreyTextColor,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/stroke/Location(stroke).svg",
                              width: 10.w,
                              height: 11.h,
                            ),
                            SizedBox(width: 4.w),
                            Text('${salon.distance} km'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
