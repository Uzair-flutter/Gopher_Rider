import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),

            Center(
              child: Text(
                "Enter your new password",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlackColor,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Enter Password",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                hintText: "Enter Password",
                suffixIcon: Icon(Iconsax.eye, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20.h),

            LinearProgressIndicator(
              minHeight: 8.h,

              borderRadius: BorderRadius.circular(4.r),
              value: 0.03,
              backgroundColor: AppColors.textFieldFillColor,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.kSecondaryColor,
              ),
            ),
            SizedBox(height: 12.h),
            passwordValidation(text: "8 characters minimum"),
            SizedBox(height: 9.h),
            passwordValidation(text: "a number"),
            SizedBox(height: 9.h),
            passwordValidation(text: "a symbol"),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, registerYourDetailsScreen);
                },
                child: Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row passwordValidation({required String text}) {
    return Row(
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.textFieldFillColor,
            border: Border.all(color: Colors.grey[200]!, width: 1.w),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
