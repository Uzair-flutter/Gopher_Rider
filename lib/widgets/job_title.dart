import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

class JobTitle extends StatelessWidget {
  final bool isUpcoming;
  const JobTitle({super.key, required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 113.h,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey[200]!, width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              DummyAssets.job,
              fit: BoxFit.fill,
              height: 81.h,
              width: 81.w,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home Cleaner",
                style: TextStyle(
                  height: 0,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.location,
                    size: 18.sp,
                    color: AppColors.textGreyColor,
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    "Home 1",
                    style: TextStyle(
                      height: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "\$25",
                style: TextStyle(
                  height: 0,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isUpcoming
                      ? Color(0xffFAECCE)
                      : Color(0xff28609B).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  isUpcoming ? "Upcoming" : "Completed",
                  style: TextStyle(
                    height: 0,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: isUpcoming
                        ? Color(0xff8C6227)
                        : AppColors.kSecondaryColor,
                  ),
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                isUpcoming ? SvgAssets.message : SvgAssets.star,
                height: 30.h,
                width: 30.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
