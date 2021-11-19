import 'package:flutter/material.dart';
import 'package:zakazi/src/modules/http.dart';

class AuthData with ChangeNotifier {
  Future loginUser(email, password) async {
    RequestResult requestResult = RequestResult('/auth/login');

    final response =
        await requestResult.sendData({"email": email, "password": password});
  }
}
