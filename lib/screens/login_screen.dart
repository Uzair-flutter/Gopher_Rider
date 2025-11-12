import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/screens/create_new_account_screen.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      // appBar: CustomAppBar(title: "Log in", isBackButtonVisible: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.kPrimaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Center(
                    child: Image.asset(
                      PngAssets.logo,
                      height: 80.w,
                      width: 80.w,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      height: 0,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Log in to access your account \nand explore our services",
                    maxLines: 2,
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter your email"),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    "Enter Password",
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      suffixIcon: Icon(Iconsax.eye, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        height: 0,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, bottomNavPage);
                      },
                      child: Text("Log in", style: TextStyle(height: 0)),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      "or",
                      style: TextStyle(
                        height: 0,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  socialLogin(
                    type: "Continue with Apple",
                    logo: SvgAssets.apple,
                  ),
                  SizedBox(height: 12.h),
                  socialLogin(
                    type: "Continue with Google",
                    logo: SvgAssets.google,
                  ),
                  SizedBox(height: 12.h),
                  socialLogin(
                    type: "Continue with Facebook",
                    logo: SvgAssets.facebook,
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, createNewAccountScreen);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
