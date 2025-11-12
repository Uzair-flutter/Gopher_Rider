import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/color_constant.dart';
import '../view_models/address_view provider.dart';
import '../widgets/bottom_shadow_bar.dart';
import '../widgets/custom_app_bar.dart';
import 'confirm_address_screen.dart';

class YourAddressScreen extends StatelessWidget {
  const YourAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Your Address', isBackButtonVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Address',
              style: TextStyle(
                height: 0,
                color: AppColors.textBlackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),

            // Address List
            Consumer<AddressProvider>(
              builder: (context, addressProvider, child) {
                return Column(
                  children: [
                    ...addressProvider.addresses.map((address) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: _buildAddressTile(
                          context,
                          address,
                          addressProvider,
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),

            SizedBox(height: 16.h),

            // Add Address Button
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmAddressScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8F5F9),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add Address',
                        style: TextStyle(
                          height: 0,
                          color: AppColors.kSecondaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.add,
                        size: 20.sp,
                        color: AppColors.kSecondaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, bookingReviewScreen);
          },
          child: Text('Continue'),
        ),
      ),
    );
  }

  Widget _buildAddressTile(
    BuildContext context,
    AddressModel address,
    AddressProvider provider,
  ) {
    return GestureDetector(
      onTap: () {
        provider.selectAddress(address.id);
      },
      child: Container(
        //  height: 105.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.textFieldFillColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: address.isSelected
                ? AppColors.kPrimaryColor
                : Color(0xFFEEEFF3),
            width: address.isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: SvgPicture.asset(
                  SvgAssets.home,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.title,
                    style: TextStyle(
                      height: 0,
                      color: AppColors.textBlackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    address.fullAddress,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.textGreyColor,
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ...[
                    SizedBox(height: 4.h),
                    Text(
                      address.landmark,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        height: 0,
                        color: AppColors.textGreyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                  if (address.floor != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      address.floor!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        height: 0,
                        color: AppColors.textGreyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: address.isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.textGreyColor,
                  width: 2,
                ),
              ),
              child: address.isSelected
                  ? Center(
                      child: Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButton(String btnTitle) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 74,
            offset: Offset(20, 0),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          // Handle continue
          debugPrint('Continue');
        },
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.kPrimaryColor.withValues(alpha: 0.16),
                blurRadius: 12,
                offset: Offset(0, 12),
                spreadRadius: -8,
              ),
            ],
          ),
          child: Center(
            child: Text(
              btnTitle,
              style: TextStyle(
                height: 0,
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
