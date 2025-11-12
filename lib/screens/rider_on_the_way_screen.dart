import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:iconsax/iconsax.dart';

class RiderOnTheWayScreen extends StatefulWidget {
  const RiderOnTheWayScreen({super.key});

  @override
  State<RiderOnTheWayScreen> createState() => _RiderOnTheWayScreenState();
}

class _RiderOnTheWayScreenState extends State<RiderOnTheWayScreen> {
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
                    ),
                    SizedBox(height: 20.h),
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
      ),
      // bottomNavigationBar: BottomShadowBar(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       showCancelBookingSheet(context);
      //     },
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Color(0xFFFFE6EB), // Background color
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10.r),
      //       ),
      //       elevation: 0,
      //     ),
      //     child: Text(
      //       'Cancel Booking',
      //       style: TextStyle(
      //         fontSize: 16.sp,
      //         fontWeight: FontWeight.w600,
      //         color: Color(0xFFD72547), // Text color
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  buildRiderInfo() {
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
              SvgPicture.asset(
                SvgAssets.messageBlue,
                height: 38.h,
                width: 38.w,
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

  Widget _itemsWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8F9),
        border: Border.all(width: 1, color: Color(0xFFEEEFF3)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row - Clickable
          InkWell(
            onTap: () {
              setState(() {
                _isItemsExpanded = !_isItemsExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Items',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.30,
                  ),
                ),
                AnimatedRotation(
                  turns: _isItemsExpanded ? 0 : 0.5,
                  duration: Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    size: 24.sp,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
              ],
            ),
          ),

          // Animated Items List
          AnimatedCrossFade(
            firstChild: Column(
              children: [
                SizedBox(height: 20.h),
                Column(
                  children: [
                    _itemRow('Milk 1 litre', '\$12'),
                    SizedBox(height: 12.h),
                    _itemRow('Bread 500g', '\$3'),
                    SizedBox(height: 12.h),
                    _itemRow('Eggs 12 pack', '\$5'),
                  ],
                ),
              ],
            ),
            secondChild: SizedBox.shrink(),
            crossFadeState: _isItemsExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _itemRow(String itemName, String price) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xFFEEEFF3))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName,
            style: TextStyle(
              color: Color(0xFF757273),
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
      ),
    );
  }
}
