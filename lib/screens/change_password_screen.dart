import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Change Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              "Current Password",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(decoration: InputDecoration(hintText: "Enter password")),
            SizedBox(height: 10.h),
            Text(
              "New Password",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(decoration: InputDecoration(hintText: "Enter password")),
            SizedBox(height: 10.h),
            Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(decoration: InputDecoration(hintText: "Enter password")),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: ElevatedButton(onPressed: () {}, child: Text("Update Password")),
      ),
    );
  }
}
