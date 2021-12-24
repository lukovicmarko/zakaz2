import 'package:flutter/material.dart';
import 'package:zakazi/src/data/auth.dart';
import 'package:zakazi/src/models/Review.dart';
import 'package:zakazi/src/modules/http.dart';

import '../models/User.dart';

class ReviewsData with ChangeNotifier {
  final List<Review> _reviews = [];

  final authData = AuthData();

  Future getReviews(String id) async {
    final token = await authData.getAccessTokenFromStorage();

    RequestResult requestResult = RequestResult('/salons/$id/reviews',
        headers: {"Authorization": "Bearer $token"});

    final reviewsResponse = await requestResult.getData();

    reviewsResponse["data"].forEach((review) => {
          _reviews.add(
            Review(
              id: review['_id'],
              user: User(
                id: review['user']['_id'],
                name: review['user']['name'],
              ),
              comment: review['comment'],
              rating: review['rating'],
            ),
          )
        });

    notifyListeners();
  }

  get reviews => _reviews;
}
