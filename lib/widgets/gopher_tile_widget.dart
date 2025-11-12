import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/service_chip_widget.dart';

class GopherModel {
  final String name;
  final String imageUrl;
  final String profession;
  final double rating;
  final List<String> services;
  final int additionalServicesCount;
  final double pricePerHour;
  final bool isAvailable;
  final bool isVerified;

  GopherModel({
    required this.name,
    required this.imageUrl,
    required this.profession,
    required this.rating,
    required this.services,
    this.additionalServicesCount = 0,
    required this.pricePerHour,
    this.isAvailable = true,
    this.isVerified = false,
  });
}

// Gopher Tile Widget
class GopherTile extends StatelessWidget {
  final GopherModel gopher;
  final VoidCallback? onTap;

  const GopherTile({super.key, required this.gopher, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Color(0xFFF6F8F9),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Avatar, Name, Rating
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // // Profile Image
                // CircleAvatar(
                //   radius: 24.r,
                //   backgroundColor: Colors.grey[300],
                //   child: Image.asset(gopher.imageUrl),
                // ),
                ClipOval(
                  child: Center(
                    child: Image.asset(
                      gopher.imageUrl,
                      fit: BoxFit.cover,
                      height: 42.h,
                      width: 42.h,
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                gopher.name,
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlackColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (gopher.isVerified) ...[
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.verified,
                                  color: AppColors.kSecondaryColor,
                                  size: 18.sp,
                                ),
                              ],
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFC627),
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                gopher.rating.toString(),
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textBlackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 18.sp,
                            color: AppColors.iconColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            gopher.profession,
                            style: TextStyle(
                              height: 0,
                              fontSize: 12.sp,
                              color: AppColors.iconColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      // Services Tags
                      Row(
                        children: [
                          ServiceChip(label: gopher.services[0]),
                          SizedBox(width: 8.w),
                          ServiceChip(label: gopher.services[1]),
                          SizedBox(width: 8.w),
                          ServiceChip(label: gopher.services[2]),
                          SizedBox(width: 5.w),
                          Text(
                            '+${gopher.additionalServicesCount}',
                            style: TextStyle(
                              color: AppColors.kSecondaryColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // if (gopher.additionalServicesCount > 0) ...[
                          //   SizedBox(width: 8.w),
                          //   ServiceChip(
                          //     label: '+${gopher.additionalServicesCount}',
                          //     isCounter: true,
                          //   ),
                          // ],
                        ],
                      ),
                      // Wrap(
                      //   spacing: 8.w,
                      //   runSpacing: 8.h,
                      //   children: [
                      //     ...gopher.services
                      //         .take(3)
                      //         .map((service) => ServiceChip(label: service)),
                      //     if (gopher.additionalServicesCount > 0)
                      //       ServiceChip(
                      //         label: '+${gopher.additionalServicesCount}',
                      //         isCounter: true,
                      //       ),
                      //   ],
                      // ),
                    ],
                  ),
                ),

                // Rating
                // Row(
                //   children: [
                //     Icon(Icons.star, color: Color(0xFFFFC627), size: 16.sp),
                //     SizedBox(width: 4.w),
                //     Text(
                //       gopher.rating.toString(),
                //       style: TextStyle(
                //         fontSize: 13.sp,
                //         fontWeight: FontWeight.w400,
                //         color: AppColors.textBlackColor,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(height: 16.h),
            // Price and Availability
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${gopher.pricePerHour.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          height: 0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '/hour',
                        style: TextStyle(
                          fontSize: 13.sp,
                          height: 0,
                          color: AppColors.iconColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // Availability Status
                Row(
                  children: [
                    Container(
                      width: 4.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: gopher.isAvailable
                            ? AppColors.kPrimaryColor
                            : AppColors.iconColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      gopher.isAvailable ? 'Available' : 'Busy',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: gopher.isAvailable
                            ? AppColors.kPrimaryColor
                            : AppColors.iconColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Create a list of gophers
final List<GopherModel> gophers = [
  GopherModel(
    name: 'Christopher Smith',
    imageUrl: DummyAssets.person,
    profession: 'Electrician',
    rating: 4.9,
    services: ['Electric', 'Plumbing', 'Cleaning'],
    additionalServicesCount: 3,
    pricePerHour: 25,
    isAvailable: true,
    isVerified: true,
  ),
  GopherModel(
    name: 'Christopher Smith',
    imageUrl: DummyAssets.person,
    profession: 'Electrician',
    rating: 4.9,
    services: ['Electric', 'Plumbing', 'Cleaning'],
    additionalServicesCount: 3,
    pricePerHour: 25,
    isAvailable: true,
    isVerified: true,
  ),
  GopherModel(
    name: 'Christopher Smith',
    imageUrl: DummyAssets.person,
    profession: 'Electrician',
    rating: 4.9,
    services: ['Electric', 'Plumbing', 'Cleaning'],
    additionalServicesCount: 3,
    pricePerHour: 25,
    isAvailable: true,
    isVerified: true,
  ),
  GopherModel(
    name: 'Christopher Smith',
    imageUrl: DummyAssets.person,
    profession: 'Electrician',
    rating: 4.9,
    services: ['Electric', 'Plumbing', 'Cleaning'],
    additionalServicesCount: 3,
    pricePerHour: 25,
    isAvailable: true,
    isVerified: true,
  ),
  GopherModel(
    name: 'Christopher Smith',
    imageUrl: DummyAssets.person,
    profession: 'Electrician',
    rating: 4.9,
    services: ['Electric', 'Plumbing', 'Cleaning'],
    additionalServicesCount: 3,
    pricePerHour: 25,
    isAvailable: true,
    isVerified: true,
  ),
  GopherModel(
    name: 'Christopher Smith',
    imageUrl: DummyAssets.person,
    profession: 'Electrician',
    rating: 4.9,
    services: ['Electric', 'Plumbing', 'Cleaning'],
    additionalServicesCount: 3,
    pricePerHour: 25,
    isAvailable: true,
    isVerified: true,
  ),
  GopherModel(
    name: 'Christopher Smith',
    imageUrl: DummyAssets.person,
    profession: 'Electrician',
    rating: 4.9,
    services: ['Electric', 'Plumbing', 'Cleaning'],
    additionalServicesCount: 3,
    pricePerHour: 25,
    isAvailable: true,
    isVerified: true,
  ),
];

// Then use it in your ListView
