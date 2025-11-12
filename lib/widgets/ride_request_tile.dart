import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';

class RideRequestTile extends StatelessWidget {
  final String riderName;
  final String riderImage;
  final double rating;
  final double price;
  final String time;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const RideRequestTile({
    super.key,
    required this.riderName,
    required this.riderImage,
    required this.rating,
    required this.price,
    required this.time,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Center(
                  child: Image.asset(
                    riderImage,
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
                        riderName,
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
                        "${rating}",
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
              Spacer(),
              Column(
                children: [
                  Text(
                    "\$${price}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  Text(
                    "${time} mins",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey[300],
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onDecline,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey[200]!, width: 1.w),
                    ),
                    child: Center(
                      child: Text(
                        "Decline",
                        style: TextStyle(
                          height: 0,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: InkWell(
                  onTap: onAccept,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey[200]!, width: 2.w),
                    ),
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          height: 0,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,

                          color: Colors.white,
                        ),
                      ),
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
