import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

// Service Chip Widget
class ServiceChip extends StatelessWidget {
  final String label;
  final bool isCounter;
  const ServiceChip({super.key, required this.label, this.isCounter = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Color(0xFFD2E2F3),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          maxLines: 1,
          style: TextStyle(
            height: 0,
            fontSize: 12.sp,
            fontWeight: isCounter ? FontWeight.bold : FontWeight.w500,
            overflow: TextOverflow.ellipsis,
            color: AppColors.kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
