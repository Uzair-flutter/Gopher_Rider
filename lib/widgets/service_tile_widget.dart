import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';

class ServiceCard {
  final String serviceName;
  final String providerName;
  final String price;
  final String rating;
  final String distance;
  final String imageUrl;

  ServiceCard({
    required this.serviceName,
    required this.providerName,
    required this.price,
    required this.rating,
    required this.distance,
    required this.imageUrl,
  });
}

class ServiceTileWidget extends StatelessWidget {
  final ServiceCard service;
  final VoidCallback? onTap;

  const ServiceTileWidget({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 104.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xFFEEEFF3),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  service.imageUrl,
                  fit: BoxFit.fill,
                  width: 81.w,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.serviceName,
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Image.asset(DummyAssets.servicePerson, height: 18.h),
                      SizedBox(width: 5.w),
                      Text(
                        service.providerName,
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
                    "\$${service.price}",
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
                  Row(
                    children: [
                      Icon(
                        Iconsax.star1,
                        size: 18.sp,
                        color: Color(0xffFFC627),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        service.rating,
                        style: TextStyle(
                          height: 0,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 18.sp,
                        color: AppColors.kPrimaryColor,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        service.distance,
                        style: TextStyle(
                          height: 0,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
