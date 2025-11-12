import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:pinput/pinput.dart';

class VerifyYourEmailScreen extends StatelessWidget {
  const VerifyYourEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Verify your Email"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              textAlign: TextAlign.center,
              "We just sent 5-digit code to sarah.jansen@gmail.com, enter it bellow:",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Enter OTP",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.center,
                separatorBuilder: (index) => SizedBox(width: 4.w),
                length: 4,
                defaultPinTheme: PinTheme(
                  width: 82.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldFillColor,
                    border: Border.all(color: AppColors.textFieldFillColor),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  textStyle: TextStyle(fontSize: 16.sp),
                ),
                focusedPinTheme: PinTheme(
                  width: 82.5.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldFillColor,
                    border: Border.all(color: AppColors.kPrimaryColor),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  textStyle: TextStyle(fontSize: 16.sp),
                ),
                submittedPinTheme: PinTheme(
                  width: 82.5.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.textFieldFillColor,
                    border: Border.all(color: AppColors.textFieldFillColor),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  textStyle: TextStyle(fontSize: 16.sp),
                ),
                onChanged: (pin) {},
                onCompleted: (pin) {},
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    createPasswordScreen,
                    ModalRoute.withName(addYourEmailScreen),
                  );
                },
                child: Text("Verify email"),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wrong email? ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlackColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Send to different email",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
