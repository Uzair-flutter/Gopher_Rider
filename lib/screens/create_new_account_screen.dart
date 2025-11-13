import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/utils/string_utils.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../utils/enums.dart';
import '../view_models/service_view_model.dart';

class CreateNewAccountScreen extends StatelessWidget {
  const CreateNewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select Service'),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        spacing: 24.h,
        children: [
          _buildTitle(),
          _buildServiceCard(
            context,
            type: GopherType.professional,
            name: 'Professional Gopher',
          ),
          _buildServiceCard(context, type: GopherType.rider, name: 'Gopher'),
        ],
      ),
    );
  }

  Padding _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: RichText(
        text: TextSpan(
          text: 'Please select the type of service you require ',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textBlackColor),
          children: [
            TextSpan(
              text: 'Gopher',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' or ',
              style: TextStyle(fontSize: 14.sp),
            ),
            TextSpan(
              text: 'Professional',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildServiceCard(
    BuildContext context, {
    required GopherType type,
    required String name,
  }) {
    return InkWell(
      onTap: () {
        if (type == GopherType.professional) {
          context.read<ServiceViewModel>().setGopherType(type);
          Navigator.pushNamed(context, deliveryFormScreen);
        } else if (type == GopherType.rider) {
          context.read<ServiceViewModel>().setGopherType(type);
          Navigator.pushNamed(context, newAccountOnboardingScreen);
        }
      },
      borderRadius: BorderRadius.circular(10.r),
      child: Ink(
        height: 156.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        decoration: BoxDecoration(
          color: AppColors.textFieldFillColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: Text(
                  name.capitalize,
                  style: TextStyle(
                    fontSize: 24.sp,
                    height: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              //transform: Matrix4.translationValues(0, 15, 0),
              child: Image.asset(type.asset, height: 138.h, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}

Container socialLogin({required String type, required String logo}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.h),
    decoration: BoxDecoration(
      color: Color(0xffFDFBFC),
      border: Border.all(color: Colors.grey[200]!, width: 1.w),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(logo),
        SizedBox(width: 8.w),
        Text(
          type,
          style: TextStyle(
            height: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
      ],
    ),
  );
}
