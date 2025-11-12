import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class BottomBtnBar extends StatelessWidget {
  final String btnTitle;
  final VoidCallback btnOnTap;
  final bool showPrice;
  final String? title;
  final String? price;
  final String? subTitle;

  const BottomBtnBar({
    super.key,
    required this.btnTitle,
    required this.btnOnTap,
    this.title,
    this.price,
    this.subTitle,
    required this.showPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 74,
            offset: Offset(20, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: showPrice == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          //
          if (showPrice)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title! ?? 'Price',
                  style: TextStyle(
                    height: 0,
                    color: AppColors.textGreyColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  '\$${price! ?? '75'}',
                  style: TextStyle(
                    height: 0,
                    color: AppColors.textBlackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

          // Continue Button
          GestureDetector(
            onTap: btnOnTap,
            child: Container(
              width: 210.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kPrimaryColor.withOpacity(0.16),
                    blurRadius: 12,
                    offset: Offset(0, 12),
                    spreadRadius: -8,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  btnTitle,
                  style: TextStyle(
                    height: 0,
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
