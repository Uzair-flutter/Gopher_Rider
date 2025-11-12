import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

void selectPaymentMethodBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20.w,
              right: 20.w,
              top: 10.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 17.h,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Select Payment Method",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                  ),
                  Divider(color: AppColors.textFieldFillColor, thickness: 2.h),
                  _rowWidget('Credit or Debit Card'),
                  _rowWidget('Google Pay'),

                  _rowWidget('Apple Pay'),

                  SizedBox(height: 15.h),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _rowWidget(String title) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: AppColors.textFieldFillColor,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(SvgAssets.creditCard, height: 19.w, width: 19.w),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlackColor,
                ),
              ),
            ],
          ),
          Icon(Iconsax.arrow_right_3, color: AppColors.textBlackColor),
        ],
      ),
    ),
  );
}
