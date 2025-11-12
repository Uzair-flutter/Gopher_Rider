import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';

class AllReviewsScreen extends StatefulWidget {
  const AllReviewsScreen({super.key});

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Reviews',
        showSearchIcon: true,
        actionIcon: SvgAssets.reviewShare,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(children: [_buildReviewsTab()]),
        ),
      ),
    );
  }
}

Widget _buildReviewsTab() {
  final reviews = [
    {
      'name': 'John Doe',
      'rating': '5.0',
      'date': 'Oct 16, 2025',
      'comment': 'Excellent service! Very professional and thorough.',
    },
    {
      'name': 'Jane Smith',
      'rating': '4.5',
      'date': 'Oct 05, 2025',
      'comment': 'Great job! My house looks amazing.',
    },
    {
      'name': 'Mike Johnson',
      'rating': '4.8',
      'date': 'Oct 26, 2025',
      'comment': 'Highly recommended. Will book again!',
    },
    {
      'name': 'John Doe',
      'rating': '5.0',
      'date': 'Oct 16, 2025',
      'comment': 'Excellent service! Very professional and thorough.',
    },
    {
      'name': 'Jane Smith',
      'rating': '4.5',
      'date': 'Oct 05, 2025',
      'comment': 'Great job! My house looks amazing.',
    },
    {
      'name': 'Mike Johnson',
      'rating': '4.8',
      'date': 'Oct 26, 2025',
      'comment': 'Highly recommended. Will book again!',
    },
    {
      'name': 'John Doe',
      'rating': '5.0',
      'date': 'Oct 16, 2025',
      'comment': 'Excellent service! Very professional and thorough.',
    },
    {
      'name': 'Jane Smith',
      'rating': '4.5',
      'date': 'Oct 05, 2025',
      'comment': 'Great job! My house looks amazing.',
    },
    {
      'name': 'Mike Johnson',
      'rating': '4.8',
      'date': 'Oct 26, 2025',
      'comment': 'Highly recommended. Will book again!',
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...reviews.map(
        (review) => Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.textFieldFillColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Color(0xFFEEEFF3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Row(
              ///   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ///   children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      DummyAssets.person,
                      height: 42.w,
                      width: 42.w,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  review['name']!,
                                  style: TextStyle(
                                    height: 0,
                                    color: AppColors.textBlackColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.verified,
                                  size: 17.sp,
                                  color: AppColors.kSecondaryColor,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              review['date']!,
                              style: TextStyle(
                                height: 0,
                                color: Color(0xFF757273),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16.sp,
                              color: Color(0xFFFFC627),
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              review['rating']!,
                              style: TextStyle(
                                height: 0,
                                color: AppColors.textBlackColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   // mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     ClipOval(
              //       child: Image.asset(DummyAssets.person, height: 42.w),
              //     ),
              //     SizedBox(width: 10.w),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           review['name']!,
              //           style: TextStyle(
              //             height: 0,
              //             color: AppColors.textBlackColor,
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //         SizedBox(height: 4.h),
              //         Text(
              //           review['date']!,
              //           style: TextStyle(
              //             height: 0,
              //             color: Color(0xFF757273),
              //             fontSize: 11.sp,
              //             fontWeight: FontWeight.w400,
              //           ),
              //         ),
              //       ],
              //     ),
              //     SizedBox(width: 4.w),
              //     Icon(
              //       Icons.verified,
              //       size: 17.sp,
              //       color: AppColors.kSecondaryColor,
              //     ),
              //     SizedBox(width: 4.w),
              //     Spacer(),
              //     Icon(Icons.star, size: 16.sp, color: Color(0xFFFFC627)),
              //     SizedBox(width: 3.w),
              //     Text(
              //       review['rating']!,
              //       style: TextStyle(
              //         height: 0,
              //         color: AppColors.textBlackColor,
              //         fontSize: 13.sp,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
              ///   ],
              /// ),
              SizedBox(height: 12.h),
              Text(
                review['comment']!,
                style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
