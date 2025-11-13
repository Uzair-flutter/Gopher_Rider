import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/bottom_shadow_bar.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Ratings"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                "Rate your Client",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16.h),
              Text(
                "Please take a moment to rate your Gopher experience and help us improve our service!",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  ClipOval(
                    child: Center(
                      child: Image.asset(
                        DummyAssets.person,
                        fit: BoxFit.cover,
                        height: 42.w,
                        width: 42.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Christopher Smith",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlackColor,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Image.asset(
                            PngAssets.tickBadge,
                            height: 18.h,
                            width: 18.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          SizedBox(width: 4.w),
                          Text(
                            "4.4",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "How was your experience?",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 14.h),
              RatingBar(
                glow: false,
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star_rounded, color: Colors.amber),
                  half: const Icon(
                    Icons.star_half_rounded,
                    color: Colors.amber,
                  ),
                  empty: const Icon(
                    Icons.star_outline_rounded,
                    color: AppColors.textBlackColor,
                  ),
                ),
                onRatingUpdate: (double value) {},
              ),

              SizedBox(height: 30.h),
              Text(
                "Leave your thought",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 10.h),
              TextFormField(
                minLines: 4,
                maxLines: 4,
                decoration: InputDecoration(hintText: 'Type here'),
              ),
              SizedBox(height: 10.h),
              Text(
                "Write in 100 Character",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomShadowBar(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textFieldFillColor,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Later",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
