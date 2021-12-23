class Review {
  final String id;
  // final String user;
  final int rating;
  final String comment;

  Review({
    required this.id,
    // required this.user,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      // user: json['user'],
      comment: json['comment'],
    );
  }
}
