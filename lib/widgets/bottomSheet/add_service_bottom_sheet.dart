import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:provider/provider.dart';

import '../../models/ui/service_model.dart';
import '../../view_models/professional_gopher_view_model.dart';

void selectServiceBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    constraints: BoxConstraints(minWidth: double.infinity),
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Consumer<ProfessionalGopherViewModel>(
        builder: (context, viewModel, child) {
          return SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                // top: 10.h,
                bottom: 20.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Text(
                    "Select Service",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: AppColors.textBlackColor,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Search Field
                  TextFormField(
                    controller: viewModel.searchController,
                    onChanged: (value) => viewModel.notifyListeners(),
                    decoration: InputDecoration(
                      hintText: 'Search Service',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFFF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Services List
                  Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: viewModel.filteredServices.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final service = viewModel.filteredServices[index];
                        return _serviceItem(service, viewModel);
                      },
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Add Button
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.addSelectedServices();
                        viewModel.clearSearch();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _serviceItem(PGService service, ProfessionalGopherViewModel viewModel) {
  return InkWell(
    onTap: () => viewModel.toggleService(service),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          // Service Icon
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(child: ClipOval(child: Image.asset(service.icon))),
          ),

          SizedBox(width: 12.w),

          // Service Name
          Expanded(
            child: Text(
              service.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor,
              ),
            ),
          ),

          // Checkbox
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: service.isSelected
                  ? AppColors.kPrimaryColor
                  : Colors.white,
              border: Border.all(
                color: service.isSelected
                    ? AppColors.kPrimaryColor
                    : Colors.grey.shade400,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: service.isSelected
                ? Icon(Icons.check, size: 16.sp, color: Colors.white)
                : null,
          ),
        ],
      ),
    ),
  );
}
