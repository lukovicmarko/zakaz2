import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakazi/src/constants.dart';
import 'package:zakazi/src/screens/login/components/sectionSubtitle.dart';
import 'package:zakazi/src/screens/login/components/sectionTitle.dart';
import 'package:zakazi/src/screens/login/components/singInForm.dart';
import 'package:zakazi/src/screens/login/components/socialIcon.dart';

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
            SetctionTitle(title: "Welcome"),
            SizedBox(height: 5.h),
            SetctionSubTitle(subTitle: "Sign in to continue"),
            SizedBox(height: 40.h),
            SignInForm(),
            SizedBox(height: 34.h),
            Center(
              child: Text(
                'Or Continue with',
                style: TextStyle(
                  color: const Color(0XFF5E5D65),
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialIcon(icon: "assets/icons/social/Facebook(social).svg"),
                  SocialIcon(icon: "assets/icons/social/Google(social).svg"),
                  SocialIcon(icon: "assets/icons/social/Twitter(social).svg")
                ],
              ),
            ),
            SizedBox(height: 55.h),
            Center(
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  color: const Color(0XFFABAAB1),
                  fontSize: 13.sp,
                ),
              ),
            ),
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
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: kPrimaryPurple,
                    fontSize: 13.sp,
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
