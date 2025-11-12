import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonVisible;
  final bool showSearchIcon;
  final String? actionIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actionIcon,
    this.isBackButtonVisible = true,
    this.showSearchIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,

      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textBlackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      leadingWidth: isBackButtonVisible ? 60.w : 0,
      actions: [
        if (showSearchIcon)
          Container(
            padding: EdgeInsets.all(7.w),
            margin: EdgeInsets.only(right: 18.w),
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              color: AppColors.textFieldFillColor,
              shape: BoxShape.circle,
            ),
            child: actionIcon != null
                ? SvgPicture.asset(actionIcon!, height: 18.w, width: 18.w)
                : Icon(
                  Icons.search_sharp,
                  color: AppColors.textBlackColor,
                ),
          ),
      ],
      leading: isBackButtonVisible
          ? Padding(
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
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
