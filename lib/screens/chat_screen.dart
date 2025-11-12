import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/received_message_tile.dart';
import 'package:gophar_rider/widgets/send_message_tile.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 70.h,
        title: Row(
          children: [
            ClipOval(
              child: Center(
                child: Image.asset(
                  DummyAssets.person,
                  fit: BoxFit.cover,
                  height: 40.w,
                  width: 40.w,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "Christopher Smith",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlackColor,
              ),
            ),
          ],
        ),
        leadingWidth: 60.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0.w),
          child: Center(
            child: SizedBox(
              width: 72.w,
              child: Card(
                elevation: 0,
                color: AppColors.appbarBackColor,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Icon(
                      Iconsax.arrow_left,
                      color: Color(0xff292D32),
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(color: Colors.grey[200]!),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 12.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "TODAY",
                        style: TextStyle(
                          height: 0,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Disable inner scroll
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return index % 2 == 0
                            ? ReceivedMessageTile(
                                imageUrl: DummyAssets.person,
                                message:
                                    "Hi, this is Christopher, your plumber. How can I help?",
                                time: "16.04",
                              )
                            : SendMessageTile(
                                message:
                                    "Hi, this is Christopher, your plumber. How can I help?",
                                time: "16.04",
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // Input field at the bottom
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -1),
                    color: Colors.grey[200]!,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      children: [
                        Transform.rotate(
                          angle: pi / 4,
                          child: Icon(
                            Icons.attach_file,
                            size: 24.sp,
                            color: AppColors.textGreyColor,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.emoji_emotions_outlined,
                                color: AppColors.textGreyColor,
                                size: 24.sp,
                              ),
                              hintText: "Type a message",
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        SvgPicture.asset(
                          SvgAssets.sendButton,
                          height: 48.h,
                          width: 48.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
