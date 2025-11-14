import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

class JobTitle extends StatelessWidget {
  final bool isUpcoming;
  const JobTitle({super.key, required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.0),
      ),
      child: Row(
        children: [
          // Job Image
          _buildJobImage(),

          SizedBox(width: 10.w),

          // Job Details
          Expanded(child: _buildJobDetails()),
        ],
      ),
    );
  }

  Widget _buildJobImage() {
    return Container(
      height: 81.h,
      width: 81.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Image.asset(DummyAssets.job, fit: BoxFit.cover),
    );
  }

  Widget _buildJobDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header Row (Title + Badge)
        _buildHeaderRow(),

        SizedBox(height: 12.h),

        // Info Row (Date, Time, Person)
        _buildInfoRow(),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      children: [
        // Job Title
        Expanded(
          child: Text(
            "Home Cleaner",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(width: 8.w),

        // Badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.kSecondaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            "New offers",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Row(
      children: [
        // Date & Time Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInfoItem(icon: Iconsax.calendar, text: "24th Nov 2025"),
              SizedBox(height: 8.h),
              _buildInfoItem(icon: Iconsax.clock, text: "08:00 AM"),
            ],
          ),
        ),

        SizedBox(width: 8.w),

        // Person Avatar
        _buildPersonAvatar(),
      ],
    );
  }

  Widget _buildInfoItem({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18.sp, color: AppColors.kPrimaryColor),
        SizedBox(width: 3.w),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonAvatar() {
    return Container(
      height: 35.h,
      width: 35.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(DummyAssets.person, fit: BoxFit.cover),
    );
  }
}
