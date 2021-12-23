import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zakazi/src/data/auth.dart';
import 'package:zakazi/src/models/Review.dart';
import 'package:zakazi/src/models/Salon.dart';
import 'package:zakazi/src/models/Specialist.dart';
import 'package:zakazi/src/modules/http.dart';

import '../models/OpeningHours.dart';

class SalonsData with ChangeNotifier {
  SalonsData() {
    getLocation();
  }

  final List<Salon> _salons = [];
  final List<Salon> _salonsByCategory = [];
  Salon? _salon;
  String? _locationAddress;
  bool _loading = false;
  double _latitude = 0.0;
  double _longitude = 0.0;
  int _selectedTabIndex = 0;

  List<String> tabs = ['About', 'Services', 'Galery', 'Reviews'];

  final authData = AuthData();

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final postalCode = placemarks[0].postalCode;
    final addressName = placemarks[0].street;

    _latitude = position.latitude;
    _longitude = position.longitude;

    getSalons(postalCode);

    _locationAddress = addressName;

    notifyListeners();
  }

  Future getSalons(postalCode) async {
    final token = await authData.getAccessTokenFromStorage();

    RequestResult requestResult = RequestResult(
        '/salons/radius/$postalCode/5000',
        headers: {"Authorization": "Bearer $token"});

    final salonsResponse = await requestResult.getData();

    salonsResponse['data'].forEach((salon) {
      _salons.add(
        Salon(
            id: salon['_id'],
            name: salon['name'],
            image: salon['photo'],
            description: salon['description'],
            category: salon['category'],
            rating: salon['rating'],
            numReviews: salon['numReviews'],
            website: salon['website'],
            phone: salon['phone'],
            address: salon['location']['street'],
            coordinates: salon['location']['coordinates'],
            specialist: salon['specialist'] != null
                ? buildSpecialistList(salon['specialist'])
                : [],
            openingHours: buildOpeningHoursList(salon['openingHours']),
            distance: (Geolocator.distanceBetween(
                      _latitude,
                      _longitude,
                      salon['location']['coordinates'][1],
                      salon['location']['coordinates'][0],
                    ) /
                    1000)
                .toStringAsFixed(1)),
      );
    });

    notifyListeners();
  }

  UnmodifiableListView<Salon> get salons => UnmodifiableListView(_salons);

  Future getSalonsById(String id) async {
    _loading = true;

    final token = await authData.getAccessTokenFromStorage();

    RequestResult requestResult = RequestResult('/salons/$id',
        headers: {"Authorization": "Bearer $token"});

    final salonsResponse = await requestResult.getData();

    if (salonsResponse["success"] == true) {
      _salon = Salon(
        id: salonsResponse["data"]['_id'],
        name: salonsResponse["data"]['name'],
        image: salonsResponse["data"]['photo'],
        description: salonsResponse["data"]['description'],
        category: salonsResponse["data"]['category'],
        rating: salonsResponse["data"]['rating'],
        numReviews: salonsResponse["data"]['numReviews'],
        website: salonsResponse["data"]['website'],
        phone: salonsResponse["data"]['phone'],
        address: salonsResponse["data"]['location']['street'],
        coordinates: salonsResponse["data"]['location']['coordinates'],
        specialist: buildSpecialistList(salonsResponse["data"]['specialist']),
        openingHours:
            buildOpeningHoursList(salonsResponse["data"]['openingHours']),
        distance: (Geolocator.distanceBetween(
                  _latitude,
                  _longitude,
                  salonsResponse["data"]['location']['coordinates'][1],
                  salonsResponse["data"]['location']['coordinates'][0],
                ) /
                1000)
            .toStringAsFixed(1),
      );

      _loading = true;
    } else {
      _loading = false;
    }

    notifyListeners();
  }

  Future getSalonsByCategoryId(String id) async {
    _loading = true;

    final token = await authData.getAccessTokenFromStorage();

    RequestResult requestResult = RequestResult('/categories/$id/salon',
        headers: {"Authorization": "Bearer $token"});

    final salonsResponse = await requestResult.getData();

    if (salonsResponse["success"] == true) {
      salonsResponse['data'].forEach((salon) {
        _salonsByCategory.add(
          Salon(
              id: salon['_id'],
              name: salon['name'],
              image: salon['photo'],
              description: salon['description'],
              category: salon['category'],
              rating: salon['rating'],
              numReviews: salon['numReviews'],
              website: salon['website'],
              phone: salon['phone'],
              address: salon['location']['street'],
              coordinates: salon['location']['coordinates'],
              specialist: salon['specialist'] != null
                  ? buildSpecialistList(salon['specialist'])
                  : [],
              openingHours: buildOpeningHoursList(salon['openingHours']),
              distance: (Geolocator.distanceBetween(
                        _latitude,
                        _longitude,
                        salon['location']['coordinates'][1],
                        salon['location']['coordinates'][0],
                      ) /
                      1000)
                  .toStringAsFixed(1)),
        );
      });

      _loading = true;
    } else {
      _loading = false;
    }

    notifyListeners();
  }

  buildReviewList(reviews) {
    final List<Review> items = [];
    reviews.forEach((item) {
      items.add(
        Review(
          id: item['_id'],
          rating: item['rating'],
          comment: item['comment'],
        ),
      );
    });
    return items;
  }

  buildSpecialistList(specialists) {
    final List<Specialist> items = [];
    specialists.forEach((item) {
      items.add(
        Specialist(
          name: item['name'],
          image: item['photo'],
        ),
      );
    });
    return items;
  }

  buildOpeningHoursList(hours) {
    final List<OpeningHours> items = [];
    hours.forEach((item) {
      items.add(
          OpeningHours(startTime: item['startTime'], endTime: item['endTime']));
    });
    return items;
  }

  set currentTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  get selectedTabIndex => _selectedTabIndex;

  get locationAddress => _locationAddress;
  get loading => _loading;
  get salon => _salon;
  get salonsByCategory => _salonsByCategory;
}
