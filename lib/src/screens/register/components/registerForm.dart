import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/components/buttonMedium.dart';
import 'package:zakazi/src/components/formError.dart';
// import 'package:zakazi/src/components/passwordFormField.dart';
import 'package:zakazi/src/constants.dart';

import '../../../data/auth.dart';
import '../../home/home_screen.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;

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

  void signUp() async {
    final userData = Provider.of<AuthData>(context, listen: false);

    await userData.signUpUser(name, email, password);

    if (userData.isAuthenticated) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: errors.isNotEmpty ? 20.h : 20.h),
          buildEmailFormField(),
          SizedBox(height: errors.isNotEmpty ? 20.h : 20.h),
          buildPasswordFormField(),
          SizedBox(height: 15.h),
          FormError(errors: errors),
          SizedBox(height: 15.h),
          ButtonMedium(
            name: "Sign Up",
            onPress: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                signUp();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
      },
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: kInputGreyColor,
        hintText: "Name",
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.w,
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
          child: SvgPicture.asset("assets/icons/stroke/User(stroke).svg"),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
          if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
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
          vertical: 20.w,
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
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          if (value.length >= 6) {
            removeError(error: kShortPassError);
          }
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
          vertical: 20.w,
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
