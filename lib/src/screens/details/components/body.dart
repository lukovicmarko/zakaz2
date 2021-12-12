import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/screens/details/components/specialistsCard.dart';

import '../../../models/Salon.dart';
import 'infoTab.dart';

class Body extends StatelessWidget {
  final Salon salon;

  const Body({Key? key, required this.salon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 333.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(salon.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              height: size.height / 1.5.h,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              salon.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                          Container(
                            width: 56.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: kGreenColor,
                              borderRadius: BorderRadius.circular(23.0),
                            ),
                            child: Center(
                              child: Text(
                                'Open',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        salon.address,
                        style: TextStyle(
                          color: kDarkGreyTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/solid/rating4stars.svg",
                            height: 18.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '(${salon.numReviews} reviews)',
                            style: const TextStyle(color: Color(0XFFABAAB1)),
                          )
                        ],
                      ),
                      SizedBox(height: 28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoTab(
                            icon: "assets/icons/stroke/Chrome(stroke).svg",
                            name: 'Website',
                            onPress: () {},
                          ),
                          InfoTab(
                            icon: "assets/icons/stroke/Phone(stroke).svg",
                            name: 'Call',
                            onPress: () {},
                          ),
                          InfoTab(
                            icon: "assets/icons/stroke/Map-pin(stroke).svg",
                            name: 'Directions',
                            onPress: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "Salon specialists",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        height: 145.h,
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 20.w);
                          },
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const SpecialistsCard(
                              image: "assets/images/Avatar.png",
                              name: "Marko",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
