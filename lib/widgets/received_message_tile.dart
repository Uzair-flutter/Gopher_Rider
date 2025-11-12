import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';

class ReceivedMessageTile extends StatelessWidget {
  final String imageUrl;
  final String message;
  final String time;
  const ReceivedMessageTile({
    super.key,
    required this.imageUrl,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40.w,
        child: Row(
          children: [
            ClipOval(
              child: Center(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 40.w,
                  width: 40.w,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldFillColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),

                    child: Text(
                      message,
                      style: TextStyle(
                        height: 0,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    time,
                    style: TextStyle(
                      height: 0,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
