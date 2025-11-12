import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';

class SendMessageTile extends StatelessWidget {
  final String message;
  final String time;
  const SendMessageTile({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
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
    );
  }
}
