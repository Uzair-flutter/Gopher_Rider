import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:gophar_rider/widgets/phone_widget.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Contact Us"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              "Email Address",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              decoration: InputDecoration(hintText: "detroit.alex@sample.com"),
            ),
            SizedBox(height: 10.h),
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
            Text(
              "Message",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              maxLines: 7,
              decoration: InputDecoration(
                hintText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis volutpat penatibus nullam elementum pulvinar lectus cras tempus iaculis. Ut nascetur elementum orci dictumst tempus tristique viverra aliquam dui. Semper eget lobortis pharetra facilisis cursus porttitor. Non, neque eget facilisis interdum molestie est.",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.textFieldFillColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.textFieldFillColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.textFieldFillColor),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
      ),
    );
  }
}
