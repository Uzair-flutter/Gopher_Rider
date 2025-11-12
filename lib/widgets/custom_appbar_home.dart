import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';

class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      // backgroundColor: Colors.red,
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      leadingWidth: 70.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 23.w),
        child: ClipOval(
          child: Center(
            child: Image.asset(
              DummyAssets.person,
              fit: BoxFit.cover,
              height: 44.w,
              width: 44.w,
            ),
          ),
        ),
      ),
      titleSpacing: 5.w,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Hi Alexander! 👋',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              height: 0,
              color: AppColors.iconColor,
            ),
          ),
          SizedBox(height: 3.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Iconsax.location,
                  color: AppColors.textBlackColor,
                  size: 18.sp,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                'Detroit',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  height: 0,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(width: 6.w),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Iconsax.arrow_down_1,
                  color: AppColors.blackColor,
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      actionsPadding: EdgeInsets.zero,
      actions: [
        // InkWell(
        //   onTap: () {},
        //   child: Container(
        //     height: 32.h,
        //     width: 35.w,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(24.r),
        //       color: AppColors.appbarBackColor,
        //     ),
        //     child: Icon(
        //       Iconsax.message,
        //       color: AppColors.iconColor,
        //       size: 18.sp,
        //     ),
        //   ),
        // ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, notificationScreen);
          },
          child: Container(
            height: 32.h,
            width: 35.w,
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.appbarBackColor,
            ),
            child: SvgPicture.asset(SvgAssets.bell),
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
