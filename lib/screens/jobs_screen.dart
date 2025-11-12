import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:gophar_rider/widgets/job_title.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  bool alljobs = true;
  bool upcoming = false;
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonVisible: false,
        title: "Jobs",
        showSearchIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30.h),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, jobsDetailScreen);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 24.0),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.textFieldFillColor,
                      borderRadius: BorderRadius.circular(7.0.r),
                    ),
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        jobTags(
                          title: "All Jobs",
                          isSelected: alljobs,
                          onTap: () {
                            setState(() {
                              alljobs = true;
                              upcoming = false;
                              completed = false;
                            });
                          },
                        ),
                        SizedBox(width: 6.w),
                        jobTags(
                          title: "Upcoming",
                          isSelected: upcoming,
                          onTap: () {
                            setState(() {
                              alljobs = false;
                              upcoming = true;
                              completed = false;
                            });
                          },
                        ),
                        SizedBox(width: 6.w),
                        jobTags(
                          title: "Completed",
                          isSelected: completed,
                          onTap: () {
                            setState(() {
                              alljobs = false;
                              upcoming = false;
                              completed = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    spacing: 20.h,
                    children: List.generate(5, (index) {
                      return JobTitle(
                        isUpcoming: alljobs
                            ? index % 2 == 0
                                  ? true
                                  : false
                            : upcoming
                            ? true
                            : false,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget jobTags({
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.5),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kPrimaryColor.withValues(alpha: 0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? AppColors.kPrimaryColor
                  : AppColors.textBlackColor,
            ),
          ),
        ),
      ),
    ),
  );
}
