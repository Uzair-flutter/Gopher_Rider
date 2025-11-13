import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';

class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
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
        CustomSwitch(),
        SizedBox(width: 20.w),
      ],
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isOnline = !isOnline;
      }),
      child: Container(
        padding: EdgeInsets.only(
          left: isOnline ? 12.w : 4,
          right: isOnline ? 4.w : 12.w,
          top: 4.h,
          bottom: 4.h,
        ),
        decoration: BoxDecoration(
          color: isOnline ? AppColors.kSecondaryColor : AppColors.textGreyColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.white, width: 1.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 6.w,
          children: [
            isOnline
                ? Text(
                    isOnline ? 'Online' : 'Offline',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,

                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                : Container(
                    width: 20,
                    height: 20,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
            !isOnline
                ? Text(
                    isOnline ? 'Online' : 'Offline',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 1,
                      letterSpacing: -0.20,
                    ),
                  )
                : Container(
                    width: 20,
                    height: 20,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
