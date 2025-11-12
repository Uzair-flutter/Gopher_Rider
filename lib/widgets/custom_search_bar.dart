import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        filled: true,
        fillColor: Color(0xFFF6F8F9),
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.iconColor, fontSize: 16.sp),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_sharp),
        ),
      ),
    );
  }
}
