import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/view_models/ride_view_model.dart';
import 'package:gophar_rider/widgets/ride_request_tile.dart';
import 'package:provider/provider.dart';

import '../../route_generator.dart';

void showRidesRequestSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    constraints: BoxConstraints(minWidth: double.infinity),

    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20.w,
          right: 20.w,
          top: 10.h,
        ),
        child: SizedBox(
          height: 627.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  height: 5.h,
                  width: 48.w,
                  margin: EdgeInsets.only(bottom: 30.h),
                  decoration: BoxDecoration(
                    color: Color(0xffCDCFD0),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),

              // Review text
              Center(
                child: Text(
                  "Current Offers",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Divider(color: Colors.grey[200]!),
              SizedBox(height: 24.h),

              // Use Expanded here without SingleChildScrollView wrapping everything
              Expanded(
                child: Consumer<RideViewModel>(
                  builder: (_, rideViewModel, __) {
                    if (rideViewModel.rides.isEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (Navigator.canPop(context)) {
                          Navigator.of(context).pop();
                        }
                      });
                    }
                    return ListView.separated(
                      shrinkWrap: false, // Keep false for better performance
                      itemBuilder: (context, index) {
                        final rideId =
                            rideViewModel.rides[index]["id"] ?? "ride_$index";
                        return RideRequestTile(
                          index: index,
                          onView: () {
                            Navigator.pushReplacementNamed(
                              context,
                              newJobOfferScreen,
                            );
                          },
                          onIgnore: () {
                            rideViewModel.declineRide(rideId);
                          },
                          distance: rideViewModel.rides[index]["distance"],
                          riderName: rideViewModel.rides[index]["riderName"],
                          riderImage: rideViewModel.rides[index]["riderImage"],
                          rating: rideViewModel.rides[index]["rating"],
                          price: rideViewModel.rides[index]["price"],
                          time: rideViewModel.rides[index]["time"],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20.h);
                      },
                      itemCount: rideViewModel.rides.length,
                    );
                  },
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      );
    },
  );
}
