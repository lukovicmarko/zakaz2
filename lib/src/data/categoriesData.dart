import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:zakazi/src/data/auth.dart';

import 'package:zakazi/src/models/Category.dart';
import 'package:zakazi/src/modules/http.dart';
// import 'package:flutter_config/flutter_config.dart';

class CategoriesData with ChangeNotifier {
  CategoriesData() {
    getCategories();
  }

  final authData = AuthData();

  final LocalStorage storage = LocalStorage('localstorage_app');

  final List<Category> _categories = [];

  Future getCategories() async {
    final token = await authData.getLocalStorage();

    RequestResult requestResult = RequestResult('/categories',
        headers: {"Authorization": "Bearer $token"});

    final categoriesResponse = await requestResult.getData();

    categoriesResponse['data'].forEach((category) {
      _categories.add(
        Category(
          id: category['_id'],
          name: category['name'],
          image: category['photo'],
        ),
      );
    });

    notifyListeners();
  }

  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);
}
