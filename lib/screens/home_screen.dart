import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/custom_appbar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // SizedBox(height: 8.h),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xFF28609B), Color(0xFF053F7C)],
                  ),
                ),
              ),
            ),
            // White container at bottom
            Positioned.fill(
              top: 100.h,
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
                // _customAppBarHome(context),
                SizedBox(height: 10.h),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Your Balance',
                //         style: TextStyle(fontSize: 16.sp, color: Colors.white),
                //       ),
                //       Text(
                //         '\$ 12,60.35 ',
                //         style: TextStyle(
                //           fontSize: 35.sp,
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 15.h),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    // image: DecorationImage(
                    //   image: AssetImage(DummyAssets.map),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.w,
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          DummyAssets.homeMap,
                          fit: BoxFit.fill,
                          height: 568.h,
                        ),
                        Positioned(
                          right: 10.w,
                          top: 10.h,
                          child: CustomSwitch(),
                        ),
                        Positioned(
                          left: 10.w,
                          top: 10.h,
                          child: _rowWidget(context, title: 'DropOff'),
                        ),
                        Positioned(
                          right: 10.w,
                          bottom: 10.h,
                          left: 10.w,
                          child: _rideWidgetTile(
                            context,
                            title: 'Active Ride',
                            userName: 'Christopher Smith',
                            userAddress:
                                '2487 Maplewood Drive, Austin, TX 787...',
                            userImage: DummyAssets.person,
                            onChatTap: () {
                              // Handle tap
                            },
                          ),
                        ),
                      ],
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

  Widget _rowWidget(BuildContext context, {required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.kPrimaryColor,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(width: 5.w),
          SvgPicture.asset(SvgAssets.arrowRight),
        ],
      ),
    );
  }

  Widget _rideWidgetTile(
    BuildContext context, {
    required String title,
    required String userName,
    required String userAddress,
    required String userImage,
    VoidCallback? onChatTap,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF28609B), Color(0xFF053F7C)],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              height: 0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  height: 30.w,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                  ),
                  child: ClipOval(
                    child: Image.asset(userImage, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          height: 0,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        userAddress,
                        style: TextStyle(
                          fontSize: 10.sp,
                          height: 0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGreyColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: onChatTap,
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      SvgAssets.chat,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customAppBarHome(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      color: AppColors.kPrimaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Profile Avatar
            _buildProfileAvatar(),

            SizedBox(width: 12.w),

            // User Info (Name & Rating)
            Expanded(child: _buildUserInfo()),

            // Balance Section
            _buildBalanceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
      ),
      child: ClipOval(
        child: Image.asset(DummyAssets.person, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            'Alexander Daniel',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Iconsax.star1, color: Color(0xFFFFC627), size: 16.sp),
            SizedBox(width: 4.w),
            Text(
              '4.5',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Your Balance',
          style: TextStyle(fontSize: 10.sp, color: Colors.white),
        ),
        Text(
          '\$12,60.35',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
