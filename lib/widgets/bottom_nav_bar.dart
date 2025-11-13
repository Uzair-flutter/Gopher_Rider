import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/view_models/bottom_nav_view_model.dart';
import 'package:provider/provider.dart';

import '../models/ui/bottom_nav.dart';
import '../utils/assets.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const List<BottomNavItem> _items = [
    BottomNavItem(
      label: 'Home',
      selectedIcon: SvgAssets.homeFilled,
      unselectedIcon: SvgAssets.home,
    ),
    BottomNavItem(
      label: 'Jobs',
      selectedIcon: SvgAssets.jobsFilled,
      unselectedIcon: SvgAssets.jobs,
    ),
    BottomNavItem(
      label: 'Notifications',
      selectedIcon: SvgAssets.bellFilled,
      unselectedIcon: SvgAssets.bell,
    ),
    BottomNavItem(
      label: 'Profile',
      selectedIcon: SvgAssets.profileFilled,
      unselectedIcon: SvgAssets.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: 58.h,
          color: Colors.white,
          child: Consumer<BottomNavViewModel>(
            builder: (context, provider, child) {
              final int currentPage = provider.currentPage;
              return Row(
                children: [
                  _buildNavBarItem(
                    context: context,
                    item: _items[0],
                    index: 0,
                    isSelected: currentPage == 0,
                  ),
                  _buildNavBarItem(
                    context: context,
                    item: _items[1],
                    index: 1,
                    isSelected: currentPage == 1,
                  ),
                  _buildNavBarItem(
                    context: context,
                    item: _items[2],
                    index: 2,
                    isSelected: currentPage == 2,
                  ),
                  _buildNavBarItem(
                    context: context,
                    item: _items[3],
                    index: 3,
                    isSelected: currentPage == 3,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Expanded _buildNavBarItem({
    required BuildContext context,
    required BottomNavItem item,
    required bool isSelected,
    required int index,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.read<BottomNavViewModel>().changePage(index);
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                isSelected ? item.selectedIcon : item.unselectedIcon,
                color: isSelected ? AppColors.kPrimaryColor : null,
                height: 24.h,
                width: 24.h,
              ),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.textGreyColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
