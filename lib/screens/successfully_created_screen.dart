import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';

class SuccessfullyCreatedScreen extends StatelessWidget {
  const SuccessfullyCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(PngAssets.flower, height: 88.h, width: 88.w),
            ),
            SizedBox(height: 50.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Your account was successfully created!",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Only one click to explore Gopher.",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    bottomNavPage,
                    (route) => false,
                  );
                },
                child: Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
