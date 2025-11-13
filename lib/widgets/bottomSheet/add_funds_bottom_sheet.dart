import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';

import '../dialog box/start_ride_dailog_box.dart';

void showAddFundsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
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
                  Center(
                    child: Text(
                      "Send Your Offer",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 18.h),
                  Divider(color: AppColors.textFieldFillColor, thickness: 2.h),
                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldFillColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Enter Amount",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlackColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$",
                              style: TextStyle(
                                fontSize: 40.sp,
                                color: Color(0xff757273),
                                letterSpacing: 2,
                              ),
                            ),
                            IntrinsicWidth(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 10,
                                  maxWidth: 310.w,
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    // Display field with the value + .00
                                    //   _buildFieldWith00(),
                                    TextFormField(
                                      maxLines: null,
                                      minLines: 1,

                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter.digitsOnly,
                                      //   LengthLimitingTextInputFormatter(6),
                                      // ],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 40.sp,
                                        color: Color(0xff757273),
                                        letterSpacing: 0,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        hintText: '0',
                                        hintStyle: TextStyle(
                                          fontSize: 40.sp,
                                          color: Color(0xff757273),
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                            decimal: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showRideStartDialog(screenContext: context);

                              // selectPaymentMethodBottomSheet(context);
                            },
                            child: Text("Send Offer"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Container amountChip(List<int> amount, int index, bool isSelected) {
  return Container(
    margin: EdgeInsets.only(right: 10.w),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
    decoration: BoxDecoration(
      color: isSelected
          ? AppColors.kPrimaryColor.withValues(alpha: 0.2)
          : AppColors.textFieldFillColor,
      borderRadius: BorderRadius.circular(30.r),
    ),
    child: Text(
      "\$${amount[index]}",
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: isSelected ? AppColors.kPrimaryColor : AppColors.textGreyColor,
      ),
    ),
  );
}
