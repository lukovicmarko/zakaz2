import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/components/buttonMedium.dart';

import '../../../models/Salon.dart';
import 'aboutTitle.dart';

class AboutSalon extends StatelessWidget {
  const AboutSalon({Key? key, required this.salon}) : super(key: key);

  final Salon salon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(salon.description),
          SizedBox(height: 25.h),
          const AboutTitle(title: "Opening hours"),
          SizedBox(height: 10.h),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: salon.openingHours.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(salon.openingHours[index].startTime),
                    Text(salon.openingHours[index].endTime)
                  ],
                );
              },
            ),
          ),
          const AboutTitle(title: "Contact"),
          SizedBox(height: 10.h),
          Text(salon.phone),
          SizedBox(height: 20.h),
          const AboutTitle(title: "Address"),
          SizedBox(height: 10.h),
          Text(salon.address),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 210.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                salon.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          ButtonMedium(
              name: 'Get Directions - ${salon.distance} km', onPress: () {})
        ],
      ),
    );
  }
}
