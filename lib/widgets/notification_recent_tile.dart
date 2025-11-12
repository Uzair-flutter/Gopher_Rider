import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';

class NotificationRequestTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String description;
  final String withButtonText;
  final String greenButtonText;
  const NotificationRequestTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.description,
    required this.withButtonText,
    required this.greenButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Center(
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 50.w,
                    width: 50.w,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            height: 0,

                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            height: 0,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGreyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      description,
                      style: TextStyle(
                        height: 0,

                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 120.w,
                padding: EdgeInsets.symmetric(vertical: 13.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    withButtonText,
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kSecondaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 120.w,

                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    greenButtonText,
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
