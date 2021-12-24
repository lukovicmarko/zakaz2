import 'package:zakazi/src/models/Category.dart';
import 'package:zakazi/src/models/OpeningHours.dart';
import 'package:zakazi/src/models/Specialist.dart';

class Salon {
  final String id;
  final String name;
  final String image;
  final String description;
  final Category? category;
  final int rating;
  final int numReviews;
  final String website;
  final String phone;
  final String address;
  final List coordinates;
  final String distance;
  final List<Specialist> specialist;
  final List<OpeningHours> openingHours;

  Salon({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.category,
    required this.rating,
    required this.numReviews,
    required this.website,
    required this.phone,
    required this.address,
    required this.coordinates,
    required this.distance,
    required this.specialist,
    required this.openingHours,
  });
}
