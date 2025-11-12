import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/color_constant.dart';

import '../utils/assets.dart';
import '../widgets/custom_appbar_home.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/gopher_tile_widget.dart';
import '../widgets/home_carousel_widget.dart';
import '../widgets/service_item_widget.dart';

class ServicesData {
  static final List<ServiceItem> services = [
    ServiceItem(icon: SvgAssets.appliance, label: 'Appliance'),
    ServiceItem(icon: SvgAssets.repairing, label: 'Painting'),
    ServiceItem(icon: SvgAssets.shifting, label: 'Shifting'),
    ServiceItem(icon: SvgAssets.cleaning, label: 'Cleaning'),
    ServiceItem(icon: SvgAssets.ac, label: 'AC Clean'),
    ServiceItem(icon: SvgAssets.massage, label: 'Massage'),
    ServiceItem(icon: SvgAssets.laundry, label: 'Laundry'),
    ServiceItem(icon: SvgAssets.beauty, label: 'Beauty'),
  ];
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomSearchBar(),
            ),
            // SizedBox(height: 8.h),
            HomeCarouselWidget(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                // height: 158.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  //    color: Colors.red,
                  // image: DecorationImage(
                  //   image: AssetImage(DummyAssets.map),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Image.asset(
                  DummyAssets.map,
                  fit: BoxFit.cover,
                  // height: 185.h,
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    'Our Services',
                    style: TextStyle(
                      height: 0,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, allServicesScreen);
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        height: 0,
                        fontSize: 14.sp,
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            // ServicesSection(
            //   services: [
            //     ServiceItem(icon: Icons.kitchen, label: 'Appliance'),
            //     ServiceItem(icon: Icons.format_paint, label: 'Painting'),
            //     ServiceItem(icon: Icons.local_shipping, label: 'Shifting'),
            //     ServiceItem(icon: Icons.cleaning_services, label: 'Cleaning'),
            //     ServiceItem(icon: Icons.ac_unit, label: 'AC Clean'),
            //     ServiceItem(icon: Icons.spa, label: 'Massage'),
            //     ServiceItem(
            //       icon: Icons.local_laundry_service,
            //       label: 'Laundry',
            //     ),
            //     ServiceItem(icon: Icons.face, label: 'Beauty'),
            //   ],
            //   onViewAll: () {
            //     // Navigate to all services page
            //     print('View All tapped');
            //   },
            // ),
            _buildServicesSection(context),
            SizedBox(height: 30.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //   child: GopherTile(
            //     gopher: GopherModel(
            //       name: 'Christopher Smith',
            //       imageUrl: DummyAssets.person,
            //       profession: 'Electrician',
            //       rating: 4.9,
            //       services: ['Electric', 'Plumbing', 'Repair'],
            //       additionalServicesCount: 3,
            //       pricePerHour: 25,
            //       isAvailable: true,
            //       isVerified: true,
            //     ),
            //     onTap: () {
            //       // Navigate to gopher detail page
            //       print('Gopher tile tapped');
            //     },
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    'Top Gopher',
                    style: TextStyle(
                      height: 0,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, allGopherScreen);
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        height: 0,
                        fontSize: 14.sp,
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 300.h,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 80.h),
                itemCount: gophers.length,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return GopherTile(
                    gopher: gophers[index],
                    onTap: () {
                      // Navigate to detail page
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Wrap(
      spacing: 15.w,
      runSpacing: 18.h,
      children: [
        for (var service in ServicesData.services)
          SizedBox(
            width: (MediaQuery.of(context).size.width - 32.w - 36.w) / 4,
            child: ServiceItemWidget(service: service),
          ),
      ],
    );
  }
}
