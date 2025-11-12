// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gophar_rider/utils/assets.dart';
// import 'package:gophar_rider/widgets/bottom_shadow_bar.dart';
// import 'package:gophar_rider/widgets/custom_app_bar.dart';
//
// import '../route_generator.dart';
// import '../utils/color_constant.dart';
//
// class ServiceDetailScreen extends StatefulWidget {
//   const ServiceDetailScreen({super.key});
//
//   @override
//   State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
// }
//
// class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
//   int selectedTabIndex = 0;
//   final List<String> tabs = ['Overview', 'Services', 'Photos', 'Reviews'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(title: 'Home Cleaning', isBackButtonVisible: true),
//       bottomNavigationBar: BottomShadowBar(child: _buildBottomBar()),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Banner Image with Profile
//             _buildBannerWithProfile(),
//
//             // Service Info Section
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 16.h),
//                   _buildServiceInfo(),
//                   SizedBox(height: 16.h),
//                   _buildServiceTypeCard(),
//                   SizedBox(height: 16.h),
//                   _buildTabBar(),
//                   SizedBox(height: 16.h),
//
//                   // Dynamic Content Based on Selected Tab
//                   _buildTabContent(),
//                   SizedBox(height: 10.h), // Space for bottom bar
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Dynamic Tab Content
//   Widget _buildTabContent() {
//     switch (selectedTabIndex) {
//       case 0:
//         return _buildOverviewTab();
//       case 1:
//         return _buildServicesTab();
//       case 2:
//         return _buildPhotosTab();
//       case 3:
//         return _buildReviewsTab();
//       default:
//         return _buildOverviewTab();
//     }
//   }
//
//   // Overview Tab Content
//   Widget _buildOverviewTab() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'About Christopher',
//           style: TextStyle(
//             height: 0,
//             color: AppColors.textBlackColor,
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 16.h),
//         Text(
//           'I believe a clean home is a happy home. Led by Christopher and backed by years of experience in the cleaning industry, we specialize in providing top-notch cleaning services tailored to meet the unique needs of each client. Whether you\'re looking for routine cleaning, a deep scrub, eco-friendly solutions, or post-construction cleanup, we\'ve got you covered.',
//           style: TextStyle(
//             color: Color(0xFF757273),
//             fontSize: 13.sp,
//             fontWeight: FontWeight.w400,
//             height: 1.62,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Services Tab Content
//   // Widget _buildServicesTab() {
//   //   final services = [
//   //     {'name': 'House Cleaning', 'price': '\$25/hour', 'duration': '2-3 hours'},
//   //     {'name': 'Deep Cleaning', 'price': '\$40/hour', 'duration': '4-5 hours'},
//   //     {
//   //       'name': 'Move In/Out Cleaning',
//   //       'price': '\$50/hour',
//   //       'duration': '3-4 hours',
//   //     },
//   //     {
//   //       'name': 'Window Cleaning',
//   //       'price': '\$30/hour',
//   //       'duration': '1-2 hours',
//   //     },
//   //     {
//   //       'name': 'Window Cleaning',
//   //       'price': '\$30/hour',
//   //       'duration': '1-2 hours',
//   //     },
//   //     {
//   //       'name': 'Window Cleaning',
//   //       'price': '\$30/hour',
//   //       'duration': '1-2 hours',
//   //     },
//   //   ];
//   //
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Text(
//   //         'All Services',
//   //         style: TextStyle(
//   //           height: 0,
//   //           color: AppColors.textBlackColor,
//   //           fontSize: 16.sp,
//   //           fontWeight: FontWeight.w600,
//   //         ),
//   //       ),
//   //       SizedBox(height: 16.h),
//   //       ...services.map(
//   //         (service) => GestureDetector(
//   //           onTap: () {},
//   //           child: Container(
//   //             margin: EdgeInsets.only(bottom: 12.h),
//   //             // height: 72.h,
//   //             padding: EdgeInsets.all(16.w),
//   //             decoration: BoxDecoration(
//   //               color: AppColors.textFieldFillColor,
//   //               borderRadius: BorderRadius.circular(10.r),
//   //               border: Border.all(color: Color(0xFFEEEFF3)),
//   //             ),
//   //             child: Row(
//   //               children: [
//   //                 ClipOval(
//   //                   child: Image.asset(
//   //                     DummyAssets.job,
//   //                     height: 40.w,
//   //                     width: 40.w,
//   //                   ),
//   //                 ),
//   //                 SizedBox(width: 15.w),
//   //                 Text(
//   //                   service['name']!,
//   //                   style: TextStyle(
//   //                     height: 0,
//   //                     color: AppColors.textBlackColor,
//   //                     fontSize: 14.sp,
//   //                     fontWeight: FontWeight.w400,
//   //                   ),
//   //                 ),
//   //                 Spacer(),
//   //                 RichText(
//   //                   text: TextSpan(
//   //                     children: [
//   //                       TextSpan(
//   //                         text: '\$25',
//   //                         style: TextStyle(
//   //                           height: 0,
//   //                           color: AppColors.textBlackColor,
//   //                           fontSize: 20.sp,
//   //                           fontWeight: FontWeight.w600,
//   //                         ),
//   //                       ),
//   //                       TextSpan(
//   //                         text: '/hour',
//   //                         style: TextStyle(
//   //                           height: 0,
//   //                           color: AppColors.textGreyColor,
//   //                           fontSize: 13.sp,
//   //                           fontWeight: FontWeight.w400,
//   //                         ),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   // Photos Tab Content
//   // Add this at the top of _ServiceDetailScreenState class
//   int? selectedServiceIndex;
//
//   Widget _buildServicesTab() {
//     final services = [
//       {'name': 'House Cleaning', 'price': '\$25/hour', 'duration': '2-3 hours'},
//       {'name': 'Deep Cleaning', 'price': '\$40/hour', 'duration': '4-5 hours'},
//       {
//         'name': 'Move In/Out Cleaning',
//         'price': '\$50/hour',
//         'duration': '3-4 hours',
//       },
//       {
//         'name': 'Window Cleaning',
//         'price': '\$30/hour',
//         'duration': '1-2 hours',
//       },
//       {
//         'name': 'Carpet Cleaning',
//         'price': '\$35/hour',
//         'duration': '2-3 hours',
//       },
//       {
//         'name': 'Office Cleaning',
//         'price': '\$28/hour',
//         'duration': '3-4 hours',
//       },
//     ];
//
//     return SizedBox(
//       //height: 300.h,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'All Services',
//             style: TextStyle(
//               height: 0,
//               color: AppColors.textBlackColor,
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(height: 16.h),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: services.length,
//             itemBuilder: (context, index) {
//               final service = services[index];
//               final isSelected = selectedServiceIndex == index;
//
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedServiceIndex = index;
//                   });
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(bottom: 12.h),
//                   padding: EdgeInsets.all(16.w),
//                   decoration: BoxDecoration(
//                     color: AppColors.textFieldFillColor,
//                     borderRadius: BorderRadius.circular(10.r),
//                     border: Border.all(
//                       color: isSelected
//                           ? AppColors.kPrimaryColor
//                           : Color(0xFFEEEFF3),
//                       width: isSelected ? 1.5 : 1,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       ClipOval(
//                         child: Image.asset(
//                           DummyAssets.job,
//                           height: 40.w,
//                           width: 40.w,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(width: 15.w),
//                       Expanded(
//                         child: Text(
//                           service['name']!,
//                           style: TextStyle(
//                             height: 0,
//                             color: AppColors.textBlackColor,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: service['price']!.split(
//                                 '/',
//                               )[0], // Gets the price part
//                               style: TextStyle(
//                                 height: 0,
//                                 color: AppColors.textBlackColor,
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             TextSpan(
//                               text:
//                                   '/${service['price']!.split('/')[1]}', // Gets the /hour part
//                               style: TextStyle(
//                                 height: 0,
//                                 color: AppColors.textGreyColor,
//                                 fontSize: 13.sp,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPhotosTab() {
//     final List<String> photos = List.generate(
//       9,
//       (index) => DummyAssets.serviceDetail,
//     );
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Photos',
//               style: TextStyle(
//                 height: 0,
//                 color: AppColors.textBlackColor,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: Text(
//                 'View All',
//                 style: TextStyle(
//                   height: 0,
//                   color: AppColors.textBlackColor,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.h),
//         StaggeredGrid.count(
//           crossAxisCount: 4,
//           mainAxisSpacing: 8.h,
//           crossAxisSpacing: 8.w,
//           children: [
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: _buildPhotoTile(photos[0]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 1,
//               child: _buildPhotoTile(photos[1]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 1,
//               child: _buildPhotoTile(photos[2]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: _buildPhotoTile(photos[3]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: _buildPhotoTile(photos[4]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 1,
//               child: _buildPhotoTile(photos[5]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 1,
//               child: _buildPhotoTile(photos[6]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: _buildPhotoTile(photos[7]),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 1,
//               child: _buildPhotoTile(photos[8]),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPhotoTile(String imagePath) {
//     return GestureDetector(
//       onTap: () {
//         debugPrint('Tapped on image');
//         // You can add full-screen image viewer here
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0xFFEEEFF3),
//           borderRadius: BorderRadius.circular(10.r),
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReviewsTab() {
//     final reviews = [
//       {
//         'name': 'John Doe',
//         'rating': '5.0',
//         'date': 'Oct 16, 2025',
//         'comment': 'Excellent service! Very professional and thorough.',
//       },
//       {
//         'name': 'Jane Smith',
//         'rating': '4.5',
//         'date': 'Oct 05, 2025',
//         'comment': 'Great job! My house looks amazing.',
//       },
//       {
//         'name': 'Mike Johnson',
//         'rating': '4.8',
//         'date': 'Oct 26, 2025',
//         'comment': 'Highly recommended. Will book again!',
//       },
//     ];
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Reviews',
//               style: TextStyle(
//                 height: 0,
//                 color: AppColors.textBlackColor,
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, allReviewsScreen);
//               },
//               child: Text(
//                 'View All',
//                 style: TextStyle(
//                   height: 0,
//                   color: AppColors.textBlackColor,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.h),
//         ...reviews.map(
//           (review) => Container(
//             margin: EdgeInsets.only(bottom: 16.h),
//             padding: EdgeInsets.all(16.w),
//             decoration: BoxDecoration(
//               color: AppColors.textFieldFillColor,
//               borderRadius: BorderRadius.circular(10.r),
//               border: Border.all(color: Color(0xFFEEEFF3)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// Row(
//                 ///   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 ///   children: [
//                 Row(
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipOval(
//                       child: Image.asset(
//                         DummyAssets.person,
//                         height: 42.w,
//                         width: 42.w,
//                       ),
//                     ),
//                     SizedBox(width: 10.w),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             // mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     review['name']!,
//                                     style: TextStyle(
//                                       height: 0,
//                                       color: AppColors.textBlackColor,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   SizedBox(width: 4.w),
//                                   Icon(
//                                     Icons.verified,
//                                     size: 17.sp,
//                                     color: AppColors.kSecondaryColor,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 4.h),
//                               Text(
//                                 review['date']!,
//                                 style: TextStyle(
//                                   height: 0,
//                                   color: Color(0xFF757273),
//                                   fontSize: 11.sp,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.star,
//                                 size: 16.sp,
//                                 color: Color(0xFFFFC627),
//                               ),
//                               SizedBox(width: 3.w),
//                               Text(
//                                 review['rating']!,
//                                 style: TextStyle(
//                                   height: 0,
//                                   color: AppColors.textBlackColor,
//                                   fontSize: 13.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Row(
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   // mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     ClipOval(
//                 //       child: Image.asset(DummyAssets.person, height: 42.w),
//                 //     ),
//                 //     SizedBox(width: 10.w),
//                 //     Column(
//                 //       mainAxisAlignment: MainAxisAlignment.start,
//                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                 //       children: [
//                 //         Text(
//                 //           review['name']!,
//                 //           style: TextStyle(
//                 //             height: 0,
//                 //             color: AppColors.textBlackColor,
//                 //             fontSize: 14.sp,
//                 //             fontWeight: FontWeight.w600,
//                 //           ),
//                 //         ),
//                 //         SizedBox(height: 4.h),
//                 //         Text(
//                 //           review['date']!,
//                 //           style: TextStyle(
//                 //             height: 0,
//                 //             color: Color(0xFF757273),
//                 //             fontSize: 11.sp,
//                 //             fontWeight: FontWeight.w400,
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     SizedBox(width: 4.w),
//                 //     Icon(
//                 //       Icons.verified,
//                 //       size: 17.sp,
//                 //       color: AppColors.kSecondaryColor,
//                 //     ),
//                 //     SizedBox(width: 4.w),
//                 //     Spacer(),
//                 //     Icon(Icons.star, size: 16.sp, color: Color(0xFFFFC627)),
//                 //     SizedBox(width: 3.w),
//                 //     Text(
//                 //       review['rating']!,
//                 //       style: TextStyle(
//                 //         height: 0,
//                 //         color: AppColors.textBlackColor,
//                 //         fontSize: 13.sp,
//                 //         fontWeight: FontWeight.w600,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 ///   ],
//                 /// ),
//                 SizedBox(height: 12.h),
//                 Text(
//                   review['comment']!,
//                   style: TextStyle(
//                     color: AppColors.textBlackColor,
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w400,
//                     height: 1.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBannerWithProfile() {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         // Banner Image
//         Container(
//           width: double.infinity,
//           height: 133.h,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(DummyAssets.serviceDetail),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//
//         // Profile Image
//         Positioned(
//           left: 24.w,
//           bottom: -41.h,
//           child: Container(
//             width: 82.w,
//             height: 82.h,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.kPrimaryColor, width: 2),
//               image: DecorationImage(
//                 image: AssetImage(DummyAssets.person),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//
//         // Message Icon
//         Positioned(
//           right: 24.w,
//           bottom: -40.h,
//           child: Container(
//             width: 32.w,
//             height: 32.w,
//             padding: EdgeInsets.all(6.5.w),
//             decoration: BoxDecoration(
//               color: Color(0xFFF6F8F9),
//               borderRadius: BorderRadius.circular(8.r),
//               border: Border.all(color: Color(0xFFEEEFF3), width: 1),
//             ),
//             child: SvgPicture.asset(SvgAssets.message_1),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildServiceInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 50.h), // Space for profile image
//         // Service Type Badge
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
//           decoration: BoxDecoration(
//             color: AppColors.kPrimaryColor,
//             borderRadius: BorderRadius.circular(5.r),
//           ),
//           child: Text(
//             'Home Cleaner',
//             style: TextStyle(
//               height: 0,
//               color: Colors.white,
//               fontSize: 13.sp,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//
//         SizedBox(height: 12.h),
//
//         // Provider Name with Verified Icon
//         Row(
//           children: [
//             Text(
//               'Christopher Smith',
//               style: TextStyle(
//                 height: 0,
//                 color: AppColors.textBlackColor,
//                 fontSize: 19.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(width: 4.w),
//             Icon(Icons.verified, size: 20.sp, color: Color(0xFF28609B)),
//           ],
//         ),
//
//         SizedBox(height: 12.h),
//
//         // Location and Rating
//         Row(
//           children: [
//             // Location
//             Icon(
//               Icons.mail_outline_rounded,
//               size: 18.sp,
//               color: AppColors.textGreyColor.withValues(alpha: 0.6),
//             ),
//             SizedBox(width: 3.w),
//             Text(
//               '1234 Elm Street (3.2 mi)',
//               style: TextStyle(
//                 height: 0,
//                 color: Color(0xFF757273),
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(width: 14.w),
//
//             // Rating
//             Icon(Icons.star, size: 18.sp, color: Color(0xFFFFC627)),
//             SizedBox(width: 3.w),
//             Text(
//               '4.4',
//               style: TextStyle(
//                 height: 0,
//                 color: Color(0xFF757273),
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildServiceTypeCard() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.centerRight,
//           end: Alignment.centerLeft,
//           colors: [Color(0xFF043F7C), Color(0xFF28609B)],
//         ),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Service Type',
//                 style: TextStyle(
//                   height: 0,
//                   color: Colors.white,
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               Text(
//                 'House Cleaning Services',
//                 style: TextStyle(
//                   height: 0,
//                   color: Colors.white,
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//             decoration: BoxDecoration(
//               color: Colors.white.withValues(alpha: 0.9),
//               borderRadius: BorderRadius.circular(5.r),
//             ),
//             child: Text(
//               'Active',
//               style: TextStyle(
//                 height: 0,
//                 color: Color(0xFF28609B),
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabBar() {
//     return Container(
//       padding: EdgeInsets.all(4.w),
//       decoration: BoxDecoration(
//         color: Color(0xFFF6F8F9),
//         border: Border.all(color: Color(0xFFEEEFF3), width: 1),
//         borderRadius: BorderRadius.circular(7.r),
//       ),
//       child: Row(
//         children: List.generate(
//           tabs.length,
//           (index) => Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   debugPrint('Selected Tab: ${tabs[index]}');
//                   selectedTabIndex = index;
//                 });
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
//                 decoration: BoxDecoration(
//                   color: selectedTabIndex == index
//                       ? Color(0xFFE1F1EA)
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(5.r),
//                 ),
//                 child: Text(
//                   tabs[index],
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     height: 0,
//                     color: selectedTabIndex == index
//                         ? AppColors.kPrimaryColor
//                         : AppColors.textBlackColor,
//                     fontSize: 12.sp,
//                     fontWeight: selectedTabIndex == index
//                         ? FontWeight.w500
//                         : FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomBar() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Price',
//               style: TextStyle(
//                 height: 0,
//                 color: Color(0xFF757273),
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 2.h),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: '\$25',
//                     style: TextStyle(
//                       height: 0,
//                       color: AppColors.textBlackColor,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   TextSpan(
//                     text: '/hour',
//                     style: TextStyle(
//                       height: 0,
//                       color: AppColors.textGreyColor,
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//
//         GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, serviceBookingScreen);
//           },
//           child: Container(
//             width: 210.w,
//             height: 50.h,
//             decoration: BoxDecoration(
//               color: AppColors.kPrimaryColor,
//               borderRadius: BorderRadius.circular(10.r),
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.kPrimaryColor.withValues(alpha: 0.16),
//                   blurRadius: 12,
//                   offset: Offset(0, 12),
//                   spreadRadius: -8,
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.send, size: 20.sp, color: Colors.white),
//                 SizedBox(width: 10.w),
//                 Text(
//                   'Book Now',
//                   style: TextStyle(
//                     height: 0,
//                     color: Colors.white,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
