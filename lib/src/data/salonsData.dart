import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:zakazi/src/data/auth.dart';
import 'package:zakazi/src/models/Salon.dart';
import 'package:zakazi/src/modules/http.dart';
import 'package:localstorage/localstorage.dart';

class SalonsData with ChangeNotifier {
  SalonsData() {
    getSalons();
  }

  final LocalStorage storage = LocalStorage('localstorage_app');
  final List<Salon> _salons = [];
  Salon? salon;

  final authData = AuthData();

  Future getSalons() async {
    final token = await authData.getLocalStorage();

    RequestResult requestResult =
        RequestResult('/salons/radius/34000/3000', headers: {});

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
    final token = await authData.getLocalStorage();

    RequestResult requestResult = RequestResult('/salons/$id', headers: {});

    final salonsResponse = await requestResult.getData();

    salon = Salon(
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

    notifyListeners();
  }
}
