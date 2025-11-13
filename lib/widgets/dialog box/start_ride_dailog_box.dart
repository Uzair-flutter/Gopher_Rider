import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';

void showRideStartDialog({required BuildContext screenContext}) {
  showDialog(
    context: screenContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Container(
            //  height: 180.h,
            width: 342.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Center(
                        child: Image.asset(
                          DummyAssets.person,
                          fit: BoxFit.cover,
                          height: 42.w,
                          width: 42.w,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Christopher Smith",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Row(
                    //       children: [
                    //
                    //         SizedBox(width: 4.w),
                    //         Image.asset(
                    //           PngAssets.tickBadge,
                    //           height: 18.h,
                    //           width: 18.w,
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(height: 8.h),
                    //     Row(
                    //       children: [
                    //         Icon(Icons.star, color: Colors.amber, size: 16.sp),
                    //         SizedBox(width: 4.w),
                    //         Text(
                    //           "4.4",
                    //           style: TextStyle(
                    //             fontSize: 13.sp,
                    //             fontWeight: FontWeight.w500,
                    //             color: AppColors.textBlackColor,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, chatScreen);
                      },
                      child: SvgPicture.asset(
                        SvgAssets.messageBlue,
                        height: 38.h,
                        width: 38.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  "The rider has arrived at your location. Kindly take your parcel.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlackColor,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, riderStartScreen);
                    },
                    child: Text("Start Job"),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
