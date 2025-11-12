import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:gophar_rider/widgets/phone_widget.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipOval(
                    child: Center(
                      child: Image.asset(
                        DummyAssets.person,
                        fit: BoxFit.cover,
                        height: 64.w,
                        width: 64.w,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    right: 130.w,
                    child: Container(
                      height: 35.w,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.camera,
                        color: Colors.white,
                        size: 21.w,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(hintText: "Alexander Detorit"),
              ),
              SizedBox(height: 10.h),
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
                decoration: InputDecoration(
                  hintText: "detroit.alex@sample.com",
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Date Of Birth",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(decoration: InputDecoration(hintText: "12 March 1997")),
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
              // Add more widgets here for editing profile details
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: ElevatedButton(onPressed: () {}, child: Text("Update Changes")),
      ),
    );
  }
}
