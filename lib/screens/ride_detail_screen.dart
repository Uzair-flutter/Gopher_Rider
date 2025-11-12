import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/dialog%20box/ride_complete_dailog_box.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/bottomSheet/cancel_booking.dart';
import '../widgets/bottom_shadow_bar.dart';

class RideDetailScreen extends StatelessWidget {
  const RideDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 63.h),
            buildRiderInfo(context: context),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.textFieldFillColor,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: InkWell(
                onTap: () {
                  showRideCompleteDialog(screenContext: context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35.h,
                          width: 35.w,
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kPrimaryColor,
                            //borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Icon(
                            Iconsax.location,
                            color: Colors.white,
                            size: 18.w,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup',
                              style: TextStyle(
                                color: AppColors.textBlackColor,
                                fontSize: 13.sp,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              '02:12 pm',
                              style: TextStyle(
                                height: 0,
                                color: AppColors.textGreyColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Text(
                      'Ongoing',
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.textFieldFillColor,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                      height: 0,
                      color: AppColors.textGreyColor,
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    '\$1.120',
                    style: TextStyle(
                      height: 0,
                      color: AppColors.textBlackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 303.h,
              width: 342.w,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.textFieldFillColor,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Image.asset(DummyAssets.deliveryMap, fit: BoxFit.fill),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            showCancelBookingSheet(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFE6EB), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            elevation: 0,
          ),
          child: Text(
            'Cancel Booking',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD72547), // Text color
            ),
          ),
        ),
      ),
    );
  }

  Container buildRiderInfo({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Christopher Smith",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Image.asset(
                        PngAssets.tickBadge,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "4.4",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          Divider(color: Colors.grey[200], height: 3.h),
          SizedBox(height: 20.h),
          Text(
            "Rider is on his way and will be there shortly. Please be ready for the service!",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
