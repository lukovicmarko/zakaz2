import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zakazi/src/modules/http.dart';

import '../models/User.dart';

class AuthData with ChangeNotifier {
  AuthData() {
    getUserFromLocalStorage();
  }

  bool _isLogged = false;
  late User _user;
  SharedPreferences? storage;

  //var token =  await getAccessTokenToStorage();

  Future loginUser(email, password) async {
    RequestResult requestResult = RequestResult('/auth/login', headers: {});

    final response =
        await requestResult.sendData({"email": email, "password": password});

    if (response["success"] == true) {
      _user = User(
        id: response["user"]["_id"],
        name: response["user"]["name"],
        email: response["user"]["email"],
        image: response["user"]["image"] ?? "assets/images/user.png",
      );
      _isLogged = true;
      saveUserToLocalStorage(_user);
      saveTokenToLocalStorage(response["token"]);
    } else {
      _isLogged = false;
    }

    notifyListeners();
  }

  Future getUser() async {
    // final token = await getLocalStorage();

    // RequestResult requestResult = RequestResult('/auth/user',
    //     headers: {"Authorization": "Bearer $token"});

    // final response = await requestResult.getData();

    // if (response["success"] == true) {
    //   _user = User(
    //     id: response["data"]["_id"],
    //     name: response["data"]["name"],
    //     email: response["data"]["email"],
    //   );
    //   _isLogged = true;
    //   saveUserToLocalStorage(_user);
    // } else {
    //   _isLogged = false;
    // }
  }

  // void saveLocalStorage(accessToken) {
  //   storage.setItem('token', accessToken);
  // }

  void saveTokenToLocalStorage(token) async {
    storage = await SharedPreferences.getInstance();
    storage?.setString("token", token);
  }

  getAccessTokenFromStorage() async {
    storage = await SharedPreferences.getInstance();
    var token = storage?.getString("token");

    return token;
  }

  void saveUserToLocalStorage(User user) {
    final userInfo = json.encode({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'image': user.image,
    });
    storage?.setString('userInfo', userInfo);
  }

  getUserFromLocalStorage() async {
    storage = await SharedPreferences.getInstance();
    var userInfo = storage?.getString("userInfo");

    var userData = json.decode(userInfo!);

    _user = User(
      id: userData['id'],
      name: userData['name'],
      email: userData['email'],
      image: userData["image"] ?? "assets/images/user.png",
    );

    _isLogged = true;

    notifyListeners();
  }

  get user => _user;
  get isLogged => _isLogged;
}
