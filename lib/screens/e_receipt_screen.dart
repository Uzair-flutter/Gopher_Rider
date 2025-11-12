import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';
import '../widgets/bottom_shadow_bar.dart';
import '../widgets/custom_app_bar.dart';

class EReceiptScreen extends StatelessWidget {
  const EReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'E-Receipt', isBackButtonVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 50.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xFFEEEFF3),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Image.asset(
                                    DummyAssets.serviceDetail,
                                    fit: BoxFit.fill,
                                    height: 71.h,
                                    width: 81.w,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                // Content section
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'House Cleaner',
                                            style: TextStyle(
                                              height: 0,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Iconsax.star1,
                                                size: 18.sp,
                                                color: Color(0xffFFC627),
                                              ),
                                              SizedBox(width: 3.w),
                                              Text(
                                                '4.5',
                                                style: TextStyle(
                                                  height: 0,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.textBlackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),

                                      Row(
                                        children: [
                                          Text(
                                            'John Doe',
                                            style: TextStyle(
                                              height: 0,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textGreyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),

                                      // Row 3: Price + Distance
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$22",
                                            style: TextStyle(
                                              height: 0,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textBlackColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Iconsax.location,
                                                size: 18.sp,
                                                color: AppColors.kPrimaryColor,
                                              ),
                                              SizedBox(width: 3.w),
                                              Text(
                                                '3.2 mile',
                                                style: TextStyle(
                                                  height: 0,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.textBlackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Divider(color: Colors.grey.shade300),
                            SizedBox(height: 20.h),
                            Column(
                              spacing: 15.h,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                        height: 0,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textGreyColor,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          24.r,
                                        ),
                                        color: Color(0xffD2E2F3),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 6.h,
                                      ),
                                      child: Text(
                                        'Success',
                                        style: TextStyle(
                                          height: 0,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.kSecondaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Transaction ID',
                                      style: TextStyle(
                                        height: 0,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textGreyColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'TR23456HgKL',
                                          style: TextStyle(
                                            height: 0,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textBlackColor,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Icon(
                                          Iconsax.copy,
                                          size: 16.sp,
                                          color: AppColors.kSecondaryColor,
                                        ),

                                        //Image.asset(DummyAssets.servicePerson),
                                      ],
                                    ),
                                  ],
                                ),
                                _bookingDetailRow('Name', 'Home Cleaner'),
                                _bookingDetailRow('Payment Method', 'Stripe'),
                                _bookingDetailRow('Working Hours', '2 Hours'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Worker',
                                      style: TextStyle(
                                        height: 0,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textGreyColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(DummyAssets.servicePerson),
                                        SizedBox(width: 5.w),
                                        Text(
                                          'Jan McCafferty',
                                          style: TextStyle(
                                            height: 0,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textBlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Divider(color: Colors.grey.shade300),
                            SizedBox(height: 20.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Amount',
                                  style: TextStyle(
                                    height: 0,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                                Text(
                                  '\$75',
                                  style: TextStyle(
                                    height: 0,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20.h,
                  right: 127.w,
                  left: 138.w,
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.kPrimaryColor,
                    ),
                    padding: EdgeInsets.all(15.w),
                    child: Icon(
                      Iconsax.tick_circle,
                      color: Colors.white,
                      size: 30.w,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              bottomNavPage,
              (route) => route.isFirst,
            );
          },
          child: Text('Download E-Receipt'),
        ),
      ),
    );
  }

  Widget _bookingDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            height: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textGreyColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            height: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    );
  }
}
