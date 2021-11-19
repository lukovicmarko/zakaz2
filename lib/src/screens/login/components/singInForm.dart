import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/components/buttonMedium.dart';
import 'package:zakazi/src/components/formError.dart';
// import 'package:zakazi/src/components/passwordFormField.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/data/auth.dart';
import 'package:zakazi/src/screens/home/home_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void login() async {
    final userData = Provider.of<AuthData>(context, listen: false);

    userData.loginUser(email, password);

    // Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: errors.isNotEmpty ? 0.0 : 20.h),
          buildPasswordFormField(),
          SizedBox(height: 15.h),
          FormError(errors: errors),
          SizedBox(height: 15.h),
          ButtonMedium(
            name: "Sign In",
            onPress: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                login();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: kInputGreyColor,
        hintText: "Email",
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.w,
          horizontal: 20.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kInputGreyColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kInputGreyColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        disabledBorder: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: SvgPicture.asset("assets/icons/stroke/Mail(stroke).svg"),
        ),
      ),
      // decoration: buildInputField(
      //   "Email",
      //   "assets/icons/stroke/Mail(stroke).svg",
      // ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
      },

      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: kInputGreyColor,
        hintText: "Password",
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.w,
          horizontal: 20.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kInputGreyColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kInputGreyColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        disabledBorder: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: SvgPicture.asset("assets/icons/stroke/Lock(stroke).svg"),
        ),
      ),
      // decoration: buildInputField(
      //   "Email",
      //   "assets/icons/stroke/Mail(stroke).svg",
      // ),
    );
  }
}
