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
      //backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // Background colored container
            Positioned.fill(child: Container(color: AppColors.kPrimaryColor)),

            // White container at bottom
            Positioned.fill(
              top: 600.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
              ),
            ),

            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [_buildHeader(), _buildLoginForm(context)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 280.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(PngAssets.logo, height: 80.w, width: 80.w),
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
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailField(),
          SizedBox(height: 16.h),
          _buildPasswordField(),
          SizedBox(height: 10.h),
          _buildForgotPassword(),
          SizedBox(height: 20.h),
          _buildLoginButton(context),
          SizedBox(height: 20.h),
          _buildDivider(),
          SizedBox(height: 20.h),
          _buildSocialLogins(),
          SizedBox(height: 25.h),
          _buildSignUpLink(context),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
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
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
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
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, bottomNavPage);
        },
        child: Text("Log in", style: TextStyle(height: 0)),
      ),
    );
  }

  Widget _buildDivider() {
    return Center(
      child: Text(
        "or",
        style: TextStyle(
          height: 0,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        socialLogin(type: "Continue with Apple", logo: SvgAssets.apple),
        SizedBox(height: 10.h),
        socialLogin(type: "Continue with Google", logo: SvgAssets.google),
        SizedBox(height: 10.h),
        socialLogin(type: "Continue with Facebook", logo: SvgAssets.facebook),
      ],
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
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
    );
  }
}
