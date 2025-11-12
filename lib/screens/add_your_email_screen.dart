import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

class AddEmailYourScreen extends StatelessWidget {
  const AddEmailYourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add your Email"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Text(
              textAlign: TextAlign.center,
              "Begin with creating new free account. This helps you keep your learning way easier.",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              decoration: InputDecoration(hintText: "sarah.jansen@gmail.com"),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, verifyYourEmailScreen);
                },
                child: Text("Create an account"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
