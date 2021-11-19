import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF1479FF);
const kSecondaryColor = Color(0xFF193B68);
const kGreyColor = Color(0xFFDFDEE4);
const kGreyIconColor = Color(0XFFABAAB1);
const kGreySocialIconColor = Color(0XFFDFDEE4);
const kGreyTextColor = Color(0xFFABAAB1);
const kActiveIconColor = Color(0xFF191632);
const kInactiveIconColor = Color(0xFFC4C4C4);
const kLoginGreyColor = Color(0XFFABAAB1);
const kInputGreyColor = Color(0XFFF8F8F8);
const kButtonColor = Color(0XFF6D5AE6);
const kPrimaryPurple = Color(0XFF432BDF);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
