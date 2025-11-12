import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/bottomSheet/add_funds_bottom_sheet.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Wallet"),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            walletCard(context: context),
            SizedBox(height: 24.h),
            Text(
              "Recent activity",
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: AppColors.textFieldFillColor, height: 2.h),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return paymentTile(isCredit: index % 2 == 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentTile({required bool isCredit}) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Row(
          children: [
            SvgPicture.asset((isCredit ? SvgAssets.credit : SvgAssets.debit)),
            SizedBox(width: 12.w),
            Text(
              "Wallet funded",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGreyColor,
              ),
            ),
            Spacer(),
            Text(
              "\$ 245",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isCredit ? AppColors.kPrimaryColor : Color(0xffDF1D42),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  Container walletCard({required BuildContext context}) {
    return Container(
      width: double.infinity,
      height: 199.h,
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 27.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: AssetImage(PngAssets.walletCardBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Your Balance",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Text(
            "\$ 12,60.35 ",
            style: TextStyle(
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          Chip(
            backgroundColor: Colors.white,
            padding: EdgeInsets.only(left: 8.w, right: 2.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            label: Text(
              "Add Funds",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kSecondaryColor,
              ),
            ),
            avatar: null, // Avatar is on the left side
            deleteIcon: Container(
              height: 26.w,
              width: 26.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kSecondaryColor,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 16.w),
            ),
            onDeleted: () {
              showAddFundsBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
}
