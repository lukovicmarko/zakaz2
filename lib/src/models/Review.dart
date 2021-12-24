import 'package:zakazi/src/models/User.dart';

class Review {
  final String id;
  final User user;
  final int rating;
  final String comment;

  Review({
    required this.id,
    required this.user,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      user: json['user'],
      rating: json['rating'],
      comment: json['comment'],
    );
  }
}
