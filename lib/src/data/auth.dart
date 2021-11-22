import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:zakazi/src/modules/http.dart';

import '../models/User.dart';

class AuthData with ChangeNotifier {
  AuthData() {
    getUser();
  }

  final LocalStorage storage = LocalStorage('localstorage_app');
  bool _isLogged = false;
  late User _user;

  Future loginUser(email, password) async {
    RequestResult requestResult = RequestResult('/auth/login', headers: {});

    final response =
        await requestResult.sendData({"email": email, "password": password});

    if (response["success"] == true) {
      _user = User(
        id: response["user"]["_id"],
        name: response["user"]["name"],
        email: response["user"]["email"],
      );
      _isLogged = true;
      saveUserToLocalStorage(_user);
      saveLocalStorage(response["token"]);
    } else {
      _isLogged = false;
    }
  }

  Future getUser() async {
    final token = await getLocalStorage();

    RequestResult requestResult = RequestResult('/auth/user',
        headers: {"Authorization": "Bearer $token"});

    final response = await requestResult.getData();

    if (response["success"] == true) {
      _user = User(
        id: response["data"]["_id"],
        name: response["data"]["name"],
        email: response["data"]["email"],
      );
      _isLogged = true;
      saveUserToLocalStorage(_user);
    } else {
      _isLogged = false;
    }
  }

  void saveLocalStorage(accessToken) {
    storage.setItem('token', accessToken);
  }

  getLocalStorage() async {
    await storage.ready;

    final token = storage.getItem("token");

    return token;
  }

  void saveUserToLocalStorage(User user) {
    final userInfo = json.encode({
      'id': user.id,
      'name': user.name,
      'email': user.email,
    });
    storage.setItem('userInfo', userInfo);
  }

  getUserFromLocalStorage() async {
    await storage.ready;

    Map<String, dynamic> info = json.decode(storage.getItem('userInfo'));

    _user = User(
      id: info['id'],
      name: info['name'],
      email: info['email'],
    );

    _isLogged = true;
  }

  get user => _user;
  get isLogged => _isLogged;
}
