import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:gophar_rider/widgets/notification_recent_tile.dart';
import 'package:gophar_rider/widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notifications", isBackButtonVisible: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Mark all as read",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kSecondaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              NotificationRequestTile(
                imageUrl: DummyAssets.person,
                title: 'Work Complete',
                time: '2h ago',
                description: 'You got money rating to your Gopher',
                withButtonText: 'View Details',
                greenButtonText: 'Rate Gopher',
              ),
              SizedBox(height: 20.h),
              NotificationRequestTile(
                imageUrl: DummyAssets.person,
                title: 'New job request',
                time: '2h ago',
                description: 'You got money rating to your Gopher',
                withButtonText: 'Decline',
                greenButtonText: 'Accept',
              ),
              SizedBox(height: 20.h),
              NotificationTile(
                title: 'Bank details update successfully',
                time: '2h ago',
                description: 'You got money rating to your Gopher',
              ),

              SizedBox(height: 30.h),
              Text(
                "Yesterday",
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 16.h),
              NotificationTile(
                title: 'Your password has changed',
                time: '1d ago',
                description: 'You got money rating to your Gopher',
              ),
              SizedBox(height: 16.h),
              NotificationTile(
                title: 'Your password has changed',
                time: '1d ago',
                description: 'You got money rating to your Gopher',
              ),
              SizedBox(height: 16.h),
              NotificationTile(
                title: 'Your password has changed',
                time: '1d ago',
                description: 'You got money rating to your Gopher',
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
