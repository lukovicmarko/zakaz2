import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/models/Review.dart';

import '../../../constants.dart';
import '../../../data/reviewsData.dart';
import '../../../models/Salon.dart';
import 'reviewStars.dart';

class SalonReview extends StatefulWidget {
  const SalonReview({Key? key, required this.salon, required this.reviews})
      : super(key: key);

  final Salon salon;
  final List<Review> reviews;

  @override
  State<SalonReview> createState() => _SalonReviewState();
}

class _SalonReviewState extends State<SalonReview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.h),
        SizedBox(
          height: 20.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Write your review'),
              const ReviewStars(
                stars: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: kInputGreyColor,
            hintText: "",
            contentPadding: EdgeInsets.symmetric(
              vertical: 5.w,
              horizontal: 15.h,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: kInputGreyColor, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: kInputGreyColor, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
            ),
            disabledBorder: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: SvgPicture.asset(
                  "assets/icons/stroke/Send(stroke).svg",
                  color: kButtonColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Text(
          "All reviews(${widget.salon.numReviews})",
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 260.h,
          child: ListView.builder(
            itemCount: widget.reviews.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewStars(stars: widget.reviews[index].rating),
                  Text(widget.reviews[index].comment),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
