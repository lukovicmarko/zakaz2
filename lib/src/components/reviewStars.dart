import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../constants.dart';

class ReviewStars extends StatefulWidget {
  const ReviewStars({Key? key, required this.stars}) : super(key: key);
  final int stars;
  @override
  _ReviewStarsState createState() => _ReviewStarsState();
}

class _ReviewStarsState extends State<ReviewStars> {
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      rating: widget.stars.toDouble(),
      isReadOnly: false,
      size: 20,
      filledIconData: Icons.star,
      defaultIconData: Icons.star_border,
      starCount: 5,
      allowHalfRating: false,
      color: kStarsColor,
      borderColor: kStarsColor,
      spacing: 2.0,
      onRated: (value) {
        print(value.truncate());
      },
    );
  }
}
