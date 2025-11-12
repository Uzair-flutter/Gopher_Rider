import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:gophar_rider/widgets/phone_widget.dart';

class RegisterYourDetailsScreen extends StatelessWidget {
  const RegisterYourDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Register Your Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  "Let’s create your account.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlackColor,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                "First Name",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(hintText: "Enter First Name"),
              ),
              SizedBox(height: 10.h),
              Text(
                "Enter Last Name",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(hintText: "Enter Last Name"),
              ),
              SizedBox(height: 20.h),
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              PhoneWidget(controller: TextEditingController(), filled: true),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, successfullyCreatedScreen);
                  },
                  child: Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
