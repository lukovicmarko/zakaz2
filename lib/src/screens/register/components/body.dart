import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/components/sectionSubtitle.dart';
import 'package:zakazi/src/components/sectionTitle.dart';
import 'package:zakazi/src/screens/login/components/singInForm.dart';
import 'package:zakazi/src/screens/login/components/socialIcon.dart';
import 'package:zakazi/src/screens/register/components/registerForm.dart';

import '../../register/registerScreen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 35.w, top: 60.h, right: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: "Sign Up"),
            SizedBox(height: 5.h),
            const SectionSubTitle(subTitle: "Create a new account"),
            SizedBox(height: 40.h),
            const RegisterForm(),
            SizedBox(height: 34.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: TextStyle(
                    color: const Color(0XFFABAAB1),
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: kPrimaryPurple,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
