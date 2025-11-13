import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../view_models/ride_view_model.dart';
import '../widgets/bottomSheet/add_items_bottom_sheet.dart';
import '../widgets/bottom_shadow_bar.dart';

class RiderStartScreen extends StatefulWidget {
  const RiderStartScreen({super.key});

  @override
  State<RiderStartScreen> createState() => _RiderStartScreenState();
}

class _RiderStartScreenState extends State<RiderStartScreen> {
  bool _isItemsExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 63.h),
              buildRiderInfo(),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Column(
                  children: [
                    Row(
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
                          'Completed',
                          style: TextStyle(
                            height: 0,
                            color: AppColors.kPrimaryColor,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                    Opacity(
                      opacity: 0.6,
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
                                  color: AppColors.kSecondaryColor,
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
                                    'DropOff',
                                    style: TextStyle(
                                      color: AppColors.textBlackColor,
                                      fontSize: 13.sp,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Estd. Time • 02:46 pm',
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
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              _itemsWidget(),
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
                      'Price',
                      style: TextStyle(
                        height: 0,
                        color: AppColors.textGreyColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '\$1.120',
                      style: TextStyle(
                        height: 0,
                        color: AppColors.textBlackColor,
                        fontSize: 18.sp,
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
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomShadowBar(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ratingScreen);
            },

            child: Text(
              'Mark As Complete',
              // style: TextStyle(
              //   fontSize: 16.sp,
              //   fontWeight: FontWeight.w600,
              //   color: Color(0xFFD72547), // Text color
              // ),
            ),
          ),
        ),
      ),
    );
  }

  buildRiderInfo() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Row(
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
                      height: 0,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlackColor,
                    ),
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
                      height: 0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
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
    );
  }

  Widget _itemsWidget() {
    return Consumer<RideViewModel>(
      builder: (context, itemProvider, child) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Color(0xFFD2E2F3),
            border: Border.all(width: 1, color: Color(0xFFEEEFF3)),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Items',
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      addItemBottomSheet(context);
                    },
                    child: Icon(
                      Icons.add,
                      size: 24.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),

              // Items List
              if (itemProvider.items.isNotEmpty) ...[
                SizedBox(height: 20.h),
                Column(
                  spacing: 12.h,
                  children: itemProvider.items
                      .map((item) => _itemRow(item.name, item.price))
                      .toList(),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _itemRow(String itemName, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemName,
          style: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.28,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.28,
          ),
        ),
      ],
    );
  }
}
