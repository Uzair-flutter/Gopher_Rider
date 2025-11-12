import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color_constant.dart';

// Reusable Custom Dialog Widget with SVG
class CustomDialog extends StatelessWidget {
  final String svgPath;
  final double iconSize;
  final String title;
  final String message;
  final String primaryButtonText;
  final VoidCallback onPrimaryPressed;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;
  final Color? primaryButtonColor;
  final Color? secondaryButtonColor;

  const CustomDialog({
    Key? key,
    required this.svgPath,
    this.iconSize = 120,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.primaryButtonColor,
    this.secondaryButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        height: secondaryButtonText != null ? 466.h : 400.h,
        width: 342.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.h),

              // SVG Image
              SvgPicture.asset(svgPath, height: iconSize.h, width: iconSize.w),

              SizedBox(height: 40.h),

              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                ),
              ),

              SizedBox(height: 12.h),

              // Message
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreyColor,
                  height: 1.5,
                ),
              ),

              SizedBox(height: 30.h),

              // Primary Button
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPrimaryPressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor:
                        primaryButtonColor ?? AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    primaryButtonText,
                    style: TextStyle(
                      height: 0,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Secondary Button (Optional)
              if (secondaryButtonText != null) ...[
                SizedBox(height: 12.h),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed:
                        onSecondaryPressed ?? () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color:
                            secondaryButtonColor ?? AppColors.kSecondaryColor,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      secondaryButtonText!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color:
                            secondaryButtonColor ?? AppColors.kSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Helper function to show the dialog
void showCustomDialog(
  BuildContext context, {
  required String svgPath,
  double iconSize = 120,
  required String title,
  required String message,
  required String primaryButtonText,
  required VoidCallback onPrimaryPressed,
  String? secondaryButtonText,
  VoidCallback? onSecondaryPressed,
  Color? primaryButtonColor,
  Color? secondaryButtonColor,
  bool barrierDismissible = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CustomDialog(
        svgPath: svgPath,
        iconSize: iconSize,
        title: title,
        message: message,
        primaryButtonText: primaryButtonText,
        onPrimaryPressed: onPrimaryPressed,
        secondaryButtonText: secondaryButtonText,
        onSecondaryPressed: onSecondaryPressed,
        primaryButtonColor: primaryButtonColor,
        secondaryButtonColor: secondaryButtonColor,
      );
    },
  );
}
