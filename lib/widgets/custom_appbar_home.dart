import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';

class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF28609B),
              Color(0xFF053F7C),
            ], // Your gradient colors
          ),
        ),
      ),
      // forceMaterialTransparency: true,
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
            'Alexander Daniel',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              height: 0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 3.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Iconsax.star1,
                  color: Color(0xFFFFC627),
                  size: 18.sp,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                '4.5',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  height: 0,
                  color: Colors.white,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Balance',
              style: TextStyle(height: 0, fontSize: 11.sp, color: Colors.white),
            ),
            Text(
              '\$ 12,60.35',
              style: TextStyle(
                height: 0,
                fontSize: 25.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
