import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';

class ChatListTile extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String messagePreview;
  final String time;
  final int unreadCount;
  final VoidCallback? onTap;
  const ChatListTile({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.messagePreview,
    required this.time,
    required this.unreadCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 67.h,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.5.h),
        decoration: BoxDecoration(
          color: AppColors.textFieldFillColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    height: 0,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  messagePreview,
                  style: TextStyle(
                    height: 0,

                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGreyColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    height: 0,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 16.h,
                  width: 16.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDF1D42),
                  ),
                  child: Center(
                    child: Text(
                      "$unreadCount",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 0,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
