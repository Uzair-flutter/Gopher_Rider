import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/assets.dart';
import '../../utils/color_constant.dart';
import '../../widgets/custom_appbar_home.dart';
import '../../widgets/job_title.dart';

class HomeScreenPg extends StatelessWidget {
  const HomeScreenPg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // SizedBox(height: 8.h),
            Positioned.fill(child: Container(color: AppColors.kPrimaryColor)),

            // White container at bottom
            Positioned.fill(
              top: 200.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
              ),
            ),

            // Scrollable content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                //SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Balance',
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                      Text(
                        '\$ 12,60.35 ',
                        style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'New Request',
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlackColor,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    padding: EdgeInsets.all(5.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffF53649),
                                    ),
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          JobTitle(isUpcoming: true),
                          SizedBox(height: 14.h),
                          JobTitle(isUpcoming: true),
                          SizedBox(height: 20.h),

                          GestureDetector(
                            onTap: () {
                              // context.read<RideViewModel>().setRideList();
                              // showRidesRequestSheet(context);
                            },
                            child: Image.asset(
                              DummyAssets.map,
                              fit: BoxFit.fill,
                              height: 220.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
