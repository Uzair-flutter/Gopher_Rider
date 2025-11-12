import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';

class RideTile extends StatelessWidget {
  final bool isSelected;
  final String imageUrl;
  final String title;
  final String price;
  const RideTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 99.w,
          height: 99.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.kPrimaryColor : Colors.transparent,
              width: 3.w,
            ),
            shape: BoxShape.circle,
            color: AppColors.kPrimaryColor.withValues(alpha: 0.2),
          ),
          child: Center(child: Image.asset(imageUrl)),
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          style: TextStyle(
            height: 0,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textGreyColor,
          ),
        ),
        SizedBox(height: 11.h),
        Text(
          price,
          style: TextStyle(
            height: 0,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    );
  }
}
