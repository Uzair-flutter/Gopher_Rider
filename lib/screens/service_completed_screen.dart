import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/bottom_shadow_bar.dart';

class ServiceCompletedScreen extends StatelessWidget {
  const ServiceCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Service Completed',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileBar(),
                    SizedBox(height: 20.h),
                    Divider(color: Colors.grey[200]!),
                    SizedBox(height: 20.h),
                    statusBar(),
                    SizedBox(height: 10.h),
                    timeBar(),
                    SizedBox(height: 10.h),
                    workerBar(),
                    SizedBox(height: 30.h),
                    Divider(color: Colors.grey[200]!),
                    SizedBox(height: 20.h),
                    Text(
                      "Items",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    itemRow(itemName: "Milk 1 litre", itemPrice: "\$12"),
                    SizedBox(height: 20.h),
                    itemRow(itemName: "Bread 500g", itemPrice: "\$3"),
                    SizedBox(height: 20.h),
                    itemRow(itemName: "Eggs 12 pack", itemPrice: "\$5"),
                    SizedBox(height: 20.h),
                    Divider(color: Colors.grey[200]!),
                    SizedBox(height: 20.h),
                    totalRow(),
                    SizedBox(height: 20.h),
                    Container(
                      height: 303.h,
                      width: 342.w,

                      child: Image.asset(DummyAssets.map, fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, ratingScreen);
          },
          child: Text("Give Rating"),
        ),
      ),
    );
  }

  Row totalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
        Text(
          "\$98",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    );
  }

  Row itemRow({required String itemName, required String itemPrice}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textGreyColor,
          ),
        ),
        Text(
          itemPrice,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textGreyColor,
          ),
        ),
      ],
    );
  }

  Row workerBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Worker",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textGreyColor,
          ),
        ),
        Row(
          children: [
            ClipOval(
              child: Center(
                child: Image.asset(
                  DummyAssets.person,
                  fit: BoxFit.cover,
                  height: 22.w,
                  width: 22.w,
                ),
              ),
            ),
            SizedBox(width: 7.w),
            Text(
              "14 Oct 2025 |11:00 AM",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row timeBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Time",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textGreyColor,
          ),
        ),
        Text(
          "14 Oct 2025 |11:00 AM",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    );
  }

  Row statusBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Status",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textGreyColor,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 9.h),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Text(
            "Completed",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Row profileBar() {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.asset(
            DummyAssets.job,
            fit: BoxFit.fill,
            height: 60.h,
            width: 60.w,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Christopher Smith",
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "4.8",
                        style: TextStyle(
                          height: 0,

                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGreyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "Rider",
                style: TextStyle(
                  height: 0,

                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
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
