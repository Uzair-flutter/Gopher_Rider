import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/color_constant.dart';

class ServiceItem {
  final String icon;
  final String label;

  ServiceItem({required this.icon, required this.label});
}

class ServiceItemWidget extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback? onTap;
  const ServiceItemWidget({super.key, required this.service, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon Container
          Container(
            width: 52.w,
            height: 52.h,
            padding: EdgeInsets.all(13.w),
            decoration: BoxDecoration(
              color: AppColors.widgetBackColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              service.icon,
              color: AppColors.kPrimaryColor,
              height: 18.w,
              width: 18.w,
            ),

            // Icon(
            //   service.icon,
            //   color: AppColors.kPrimaryColor,
            //   size: 24.sp,
            // ),
          ),
          SizedBox(height: 3.h),
          // Label
          Text(
            service.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 0,
              fontSize: 12.sp,
              color: AppColors.iconColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
