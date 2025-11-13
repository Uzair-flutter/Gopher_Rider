import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/widgets/bottom_shadow_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';
import '../widgets/bottomSheet/add_funds_bottom_sheet.dart';
import '../widgets/custom_app_bar.dart';

class NewJobOfferScreen extends StatelessWidget {
  const NewJobOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Job Offer',
        bgColor: AppColors.kPrimaryColor,
        titleClr: Colors.white,
      ),
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
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                      ),
                      child: SizedBox(height: 60.h),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 57.h),
                              Row(
                                children: [
                                  Text(
                                    "Christopher Smith",
                                    style: TextStyle(
                                      height: 0,
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlackColor,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18.w,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "4.4",
                                    style: TextStyle(
                                      height: 0,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textGreyColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: AppColors.kSecondaryColor,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Text(
                                      "New Offer",
                                      style: TextStyle(
                                        height: 0,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 17.h),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.location,
                                    color: AppColors.textGreyColor,
                                    size: 18.w,
                                  ),
                                  SizedBox(width: 9.w),
                                  Expanded(
                                    child: Text(
                                      "2487 Maplewood Drive, Austin, TX 78704, United States",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textGreyColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.h),
                              buildPickupDropOffInfo(
                                icon: Iconsax.shop,
                                orderType: "Pickup (Order 1)",
                                order: "2 Liters Of Milk",
                                address: "2487 Maplewood Drive",
                                distanceTime: "3.4 km ~ 6 min",
                              ),
                              SizedBox(height: 6.h),
                              buildPickupDropOffInfo(
                                icon: Iconsax.shop,
                                orderType: "Pickup (Order 2)",
                                order: "Kentucky Burger",
                                address: "2487 Maplewood Drive",
                                distanceTime: "4.1 km ~ 9 min",
                              ),
                              SizedBox(height: 6.h),
                              buildPickupDropOffInfo(
                                icon: Iconsax.location,
                                orderType: "Dropoff",
                                order: "Christopher Smith",
                                address: "2487 Maplewood Drive",
                                distanceTime: "2.1 km ~ 3 min",
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                "Comments by Customer",
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlackColor,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis volutpat penatibus nullam elementum pulvinar lectus cras tempus iaculis. Ut nascetur elementum orci dictumst tempus tristique viverra aliquam dui. Semper eget lobortis pharetra facilisis cursus porttitor. Non, neque eget facilisis interdum molestie est.",
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textBlackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 15.h,
                  left: 24.w,
                  child: Image.asset(
                    DummyAssets.person,
                    height: 82.w,
                    width: 82.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        // top: false,
        child: BottomShadowBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.textBlackColor,
                    backgroundColor: Color(0xffF6F8F9), // Text color
                    side: BorderSide(color: Color(0xffF6F8F9)), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ), // Border radius for the button
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Ignore'),
                ),
              ),
              SizedBox(width: 16.w),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    showAddFundsBottomSheet(context);
                  },
                  child: Text('Give A Quote'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPickupDropOffInfo({
    required IconData icon,
    required String orderType,
    required String order,
    required String address,
    required String distanceTime,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 30.w,
              width: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textFieldFillColor,
              ),
              child: Icon(icon, color: AppColors.kSecondaryColor, size: 18.w),
            ),
            SizedBox(height: 4.h),
            Container(
              height: 61.h,
              width: 2.w,
              color: AppColors.textFieldFillColor,
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderType,
                    style: TextStyle(
                      height: 0,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  Text(
                    distanceTime,
                    style: TextStyle(
                      height: 0,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                order,
                style: TextStyle(
                  height: 0,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 11.h),
              Text(
                address,
                style: TextStyle(
                  height: 0,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
