import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';

void showCancelBookingSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              // Center(
              //   child: Container(
              //     height: 5.h,
              //     width: 48.w,
              //     margin: EdgeInsets.only(bottom: 30.h),
              //     decoration: BoxDecoration(
              //       color: Color(0xffCDCFD0),
              //       borderRadius: BorderRadius.circular(100.r),
              //     ),
              //   ),
              // ),

              // Review text
              Center(
                child: Text(
                  "Cancel Booking",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: AppColors.textBlackColor,
                  ),
                ),
              ),

              SizedBox(height: 18.h),
              Divider(),
              SizedBox(height: 22.h),
              Text(
                textAlign: TextAlign.center,
                "Are you sure you want to cancel your booking? This action cannot be undone.",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.left,
                "Reason",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),

              // Star rating
              SizedBox(height: 10.h),

              // Text input
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Type here",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColors.textFieldFillColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColors.textFieldFillColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColors.textFieldFillColor),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // Submit button
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 19.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColors.textFieldFillColor,
                            width: 2.w,
                          ),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            "No, Go back",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 19.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),

                          color: Color(0xffD72547),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel Booking",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    },
  );
}
