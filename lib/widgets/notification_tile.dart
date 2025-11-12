import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String time;
  final String description;
  const NotificationTile({
    super.key,
    required this.title,
    required this.time,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(13.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kSecondaryColor.withValues(alpha: 0.2),
            ),
            child: Icon(
              Iconsax.lock4,
              size: 24.sp,
              color: AppColors.kSecondaryColor,
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
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          height: 0,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
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
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGreyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
