import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zakazi/src/data/auth.dart';
import 'package:zakazi/src/models/Salon.dart';
import 'package:zakazi/src/modules/http.dart';

class SalonsData with ChangeNotifier {
  SalonsData() {
    getLocation();
  }

  final List<Salon> _salons = [];
  Salon? _salon;
  String? _locationAddress;
  bool _loading = false;

  final authData = AuthData();

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = Coordinates(position.latitude, position.longitude);
    final address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    final postalCode = address.first.postalCode;
    final addressName = address.first.addressLine;

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
          reviews: salon['reviews'],
          rating: salon['rating'],
          numReviews: salon['numReviews'],
          website: salon['website'],
          phone: salon['phone'],
          address: salon['location']['street'],
        ),
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
        reviews: salonsResponse["data"]['reviews'],
        rating: salonsResponse["data"]['rating'],
        numReviews: salonsResponse["data"]['numReviews'],
        website: salonsResponse["data"]['website'],
        phone: salonsResponse["data"]['phone'],
        address: salonsResponse["data"]['location']['street'],
      );
      _loading = true;
    } else {
      _loading = false;
    }

    notifyListeners();
  }

  get locationAddress => _locationAddress;
  get loading => _loading;
  get salon => _salon;
}
