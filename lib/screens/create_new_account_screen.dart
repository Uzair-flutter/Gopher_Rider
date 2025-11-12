import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

class CreateNewAccountScreen extends StatelessWidget {
  const CreateNewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create New Account',
        isBackButtonVisible: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.h),
            Text(
              textAlign: TextAlign.center,
              "Begin with creating new free account. This helps you keep your learning way easier.",
              style: TextStyle(
                height: 0,
                color: AppColors.textBlackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, addYourEmailScreen);
                },
                child: Text("Continue with email"),
              ),
            ),
            // SizedBox(height: 12.h),
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton(
            //     style: OutlinedButton.styleFrom(
            //       side: BorderSide(
            //         color: AppColors.kSecondaryColor,
            //         width: 2.w,
            //       ),
            //       padding: EdgeInsets.symmetric(vertical: 19.h),

            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.r),
            //       ),
            //     ),
            //     onPressed: () {},
            //     child: Text(
            //       "Continue with Phone number",
            //       style: TextStyle(
            //         fontSize: 15.sp,
            //         fontWeight: FontWeight.w600,
            //         color: AppColors.kSecondaryColor,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 25.h),
            Text(
              "or",
              style: TextStyle(
                height: 0,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25.h),
            socialLogin(type: "Continue with Apple", logo: SvgAssets.apple),
            SizedBox(height: 12.h),
            socialLogin(type: "Continue with Google", logo: SvgAssets.google),
            SizedBox(height: 12.h),
            socialLogin(
              type: "Continue with Facebook",
              logo: SvgAssets.facebook,
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    height: 0,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, loginScreen);
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      height: 0,
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
    );
  }
}

Container socialLogin({required String type, required String logo}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.h),
    decoration: BoxDecoration(
      color: Color(0xffFDFBFC),
      border: Border.all(color: Colors.grey[200]!, width: 1.w),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(logo),
        SizedBox(width: 8.w),
        Text(
          type,
          style: TextStyle(
            height: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    ),
  );
}
