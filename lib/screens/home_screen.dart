import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../view_models/ride_view_model.dart';
import '../widgets/bottomSheet/ride_request_bottom_sheet.dart';
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

                Container(
                  width: double.infinity,
                  // height: 158.h,
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
                    child: GestureDetector(
                      onTap: () {
                        context.read<RideViewModel>().setRideList();
                        showRidesRequestSheet(context);
                      },
                      child: Image.asset(
                        DummyAssets.homeMap,
                        fit: BoxFit.fill,
                        height: 490.h,
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

  // Widget _buildServicesSection(BuildContext context) {
  //   return Wrap(
  //     spacing: 15.w,
  //     runSpacing: 18.h,
  //     children: [
  //       for (var service in ServicesData.services)
  //         SizedBox(
  //           width: (MediaQuery.of(context).size.width - 32.w - 36.w) / 4,
  //           child: ServiceItemWidget(service: service),
  //         ),
  //     ],
  //   );
  // }
}
