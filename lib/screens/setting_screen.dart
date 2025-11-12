import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:gophar_rider/widgets/dialog%20box/logout_dialog_box.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBackButtonVisible: false, title: "Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0.h),
              profileBar(context: context),
              SizedBox(height: 30.h),
              Text(
                "My Booking Service",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 14.h),
              Container(
                height: 78.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(
                    colors: [Color(0xff053F7C), Color(0xff28609B)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    bookingService(
                      onTap: () {},
                      title: "Upcoming",
                      icon: Iconsax.export,
                      notificationCount: "2",
                    ),
                    bookingService(
                      onTap: () {},
                      title: "Completed",
                      icon: Iconsax.truck,
                      notificationCount: "4",
                    ),
                    bookingService(
                      onTap: () {
                        Navigator.pushNamed(context, notificationScreen);
                      },
                      showBadge: false,
                      title: "Notifications",
                      icon: Iconsax.notification,
                      notificationCount: "0",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "General",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 14.h),
              profileTitle(
                context: context,
                title: "Change Password",
                svgIcon: SvgAssets.lock,
                onTap: () {
                  Navigator.pushNamed(context, changePasswordScreen);
                },
              ),
              SizedBox(height: 20.h),
              profileTitle(
                context: context,
                title: "Contact Us",
                svgIcon: SvgAssets.info,
                onTap: () {
                  Navigator.pushNamed(context, contactUsScreen);
                },
              ),
              SizedBox(height: 20.h),
              profileTitle(
                context: context,
                title: "FAQ's",
                svgIcon: SvgAssets.faqs,
                onTap: () {
                  Navigator.pushNamed(context, faqsScreen);
                },
              ),
              SizedBox(height: 20.h),
              profileTitle(
                context: context,
                title: "Privacy Policy",
                svgIcon: SvgAssets.privacyPolicy,
                onTap: () {
                  Navigator.pushNamed(context, privacyPolicyScreen);
                },
              ),
              SizedBox(height: 20.h),
              profileTitle(
                context: context,
                title: "Terms & Condition",
                svgIcon: SvgAssets.termsAndConditions,
                onTap: () {
                  Navigator.pushNamed(context, termsAndConditionsScreen);
                },
              ),
              SizedBox(height: 20.h),
              profileTitle(
                context: context,
                title: "Wallet",
                svgIcon: SvgAssets.wallet,
                onTap: () {
                  Navigator.pushNamed(context, walletScreen);
                },
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  showLogoutDialog(
                    screenContext: context,
                    desc: "Logout successful",
                    onSuccess: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        createNewAccountScreen,
                        (route) => false,
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldFillColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Transform.flip(
                        flipX: true,
                        flipY: true,
                        child: Icon(Iconsax.logout, color: Colors.red),
                      ),
                      //  SvgPicture.asset(svgIcon, height: 20.h),
                      SizedBox(width: 8.w),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 19.sp,
                        color: AppColors.textBlackColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  Row profileBar({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: Center(
            child: Image.asset(
              DummyAssets.person,
              fit: BoxFit.cover,
              height: 64.w,
              width: 64.w,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alexander Detorit",
              style: TextStyle(
                height: 0,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "detroit.alex@sample.com",
              style: TextStyle(
                height: 0,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            // Navigate to Edit Profile Screen
            Navigator.pushNamed(context, editProfileScreen);
          },
          child: Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textFieldFillColor,
              border: Border.all(color: Colors.grey[200]!),
              //  borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Iconsax.setting_2,
              size: 18.sp,
              color: AppColors.textBlackColor,
            ),
          ),
        ),
      ],
    );
  }
}

Widget profileTitle({
  required BuildContext context,
  required String title,
  required String svgIcon,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.5),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(svgIcon, height: 20.h),
          SizedBox(width: 8.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textBlackColor,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 19.sp,
            color: AppColors.textBlackColor,
          ),
        ],
      ),
    ),
  );
}

bookingService({
  required String title,
  required IconData icon,
  required String notificationCount,
  required VoidCallback onTap,
  bool showBadge = true,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 96.w,
              height: 28.h,
              child: Icon(icon, size: 24.sp, color: Colors.white),
            ),
            showBadge
                ? Positioned(
                    right: 29.w,
                    child: Container(
                      height: 16.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          notificationCount,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        SizedBox(height: 9.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
