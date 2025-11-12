// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gophar_rider/utils/assets.dart';
// import 'package:syncfusion_flutter_core/theme.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
//
// import '../../utils/color_constant.dart';
//
// class FilterBottomSheet extends StatefulWidget {
//   const FilterBottomSheet({super.key});
//
//   @override
//   State<FilterBottomSheet> createState() => _FilterBottomSheetState();
//
//   static Future<Map<String, dynamic>?> show(BuildContext context) {
//     return showModalBottomSheet<Map<String, dynamic>>(
//       context: context,
//       showDragHandle: true,
//       isScrollControlled: true,
//       // backgroundColor: Colors.red,
//       builder: (context) => const FilterBottomSheet(),
//     );
//   }
// }
//
// class _FilterBottomSheetState extends State<FilterBottomSheet> {
//   String location = 'New York';
//   String selectedService = 'All';
//   String availability = '';
//   RangeValues priceRange = RangeValues(10, 100);
//   String selectedRating = 'All';
//
//   final List<Map<String, dynamic>> services = [
//     {'icon': SvgAssets.all, 'label': 'All'},
//     {'icon': SvgAssets.appliance, 'label': 'Appliance'},
//     {'icon': SvgAssets.shifting, 'label': 'Shifting'},
//     {'icon': SvgAssets.cleaning, 'label': 'Cleaning'},
//   ];
//
//   final List<String> ratings = ['All', '5', '4', '3', '2', '1'];
//
//   @override
//   Widget build(BuildContext context) {
//     // Check if keyboard is visible
//     final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
//     final isKeyboardVisible = keyboardHeight > 0;
//
//     return Padding(
//       padding: EdgeInsets.only(bottom: keyboardHeight),
//       child: DraggableScrollableSheet(
//         expand: false,
//         initialChildSize: isKeyboardVisible ? 1.0 : 0.75,
//         minChildSize: isKeyboardVisible ? 1.0 : 0.5,
//         maxChildSize: isKeyboardVisible ? 1.0 : 0.8,
//         builder: (context, scrollController) {
//           return Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               // Drag Handle
//               // Container(
//               //   margin: EdgeInsets.only(top: 8.h),
//               //   width: 40.w,
//               //   height: 4.h,
//               //   decoration: BoxDecoration(
//               //     color: Colors.grey[300],
//               //     borderRadius: BorderRadius.circular(2.r),
//               //   ),
//               // ),
//
//               // Header
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: Text(
//                         'Filter',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     // InkWell(
//                     //   onTap: () => Navigator.pop(context),
//                     //   child: Container(
//                     //     height: 32.h,
//                     //     width: 32.h,
//                     //     decoration: BoxDecoration(
//                     //       borderRadius: BorderRadius.circular(24.r),
//                     //       color: AppColors.appbarBackColor,
//                     //     ),
//                     //     child: Icon(
//                     //       Icons.close,
//                     //       size: 18.sp,
//                     //       color: AppColors.textBlackColor,
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: Divider(
//                   height: 1,
//                   thickness: 1,
//                   color: Colors.grey.shade400,
//                 ),
//               ),
//
//               // Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Location
//                       _buildSectionTitle('Location'),
//                       SizedBox(height: 8.h),
//                       TextField(
//                         controller: TextEditingController(text: location),
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Color(0xFFF6F8F9),
//                           hintText: 'Enter location',
//                           suffixIcon: Icon(
//                             Icons.location_on_sharp,
//                             size: 20.sp,
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12.r),
//                             borderSide: BorderSide.none,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16.w,
//                             vertical: 12.h,
//                           ),
//                         ),
//                         onChanged: (value) => location = value,
//                       ),
//
//                       SizedBox(height: 20.h),
//
//                       // Service Type
//                       _buildSectionTitle('Service Type'),
//                       SizedBox(height: 12.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: services.map((service) {
//                           final isSelected =
//                               selectedService == service['label'];
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedService = service['label'];
//                               });
//                             },
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: 52.w,
//                                   height: 52.h,
//                                   padding: EdgeInsets.all(14.w),
//                                   decoration: BoxDecoration(
//                                     color: isSelected
//                                         ? AppColors.kPrimaryColor
//                                         : Color(0xFFF6F8F9),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: SvgPicture.asset(
//                                     service['icon'],
//                                     color: isSelected
//                                         ? Colors.white
//                                         : AppColors.kPrimaryColor,
//                                     //  height: 24.sp,
//                                   ),
//                                 ),
//                                 SizedBox(height: 6.h),
//                                 Text(
//                                   service['label'],
//                                   style: TextStyle(
//                                     fontSize: 13.sp,
//                                     color: AppColors.iconColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//
//                       SizedBox(height: 20.h),
//
//                       // Availability
//                       _buildSectionTitle('Availability'),
//                       SizedBox(height: 8.h),
//                       TextField(
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Color(0xFFF6F8F9),
//                           hintText: 'e.g., Available now',
//                           hintStyle: TextStyle(
//                             color: Colors.grey[400],
//                             fontSize: 14.sp,
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12.r),
//                             borderSide: BorderSide.none,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16.w,
//                             vertical: 12.h,
//                           ),
//                         ),
//                         onChanged: (value) => availability = value,
//                       ),
//
//                       SizedBox(height: 20.h),
//
//                       // Hourly Rate
//                       _buildSectionTitle('Hourly Rate'),
//                       SizedBox(height: 15.h),
//
//                       // Slider
//                       SfRangeSliderTheme(
//                         data: SfRangeSliderThemeData(
//                           activeTrackColor: AppColors.kPrimaryColor,
//                           inactiveTrackColor: AppColors.kPrimaryColor,
//                           activeTrackHeight: 4,
//                           inactiveTrackHeight: 3,
//                           thumbRadius: 10,
//                           overlayRadius: 0,
//                           thumbColor: Colors.white,
//                           thumbStrokeColor: AppColors.kPrimaryColor,
//                           thumbStrokeWidth: 3,
//                           tooltipBackgroundColor: AppColors.kPrimaryColor,
//                           tooltipTextStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           activeDividerColor: AppColors.kPrimaryColor,
//                           inactiveDividerColor: AppColors.kPrimaryColor
//                               .withOpacity(0.3),
//                           activeDividerRadius: 2,
//                           inactiveDividerRadius: 2,
//                         ),
//                         child: SfRangeSlider(
//                           min: 0,
//                           max: 200,
//                           values: SfRangeValues(
//                             priceRange.start,
//                             priceRange.end,
//                           ),
//                           interval: 1,
//                           showLabels: false,
//                           showDividers: false,
//                           enableTooltip: true,
//                           tooltipTextFormatterCallback:
//                               (dynamic actualValue, String formattedText) {
//                                 return '\$${actualValue.round()}';
//                               },
//                           tooltipShape: SfRectangularTooltipShape(),
//                           inactiveColor: AppColors.kPrimaryColor.withOpacity(
//                             0.3,
//                           ),
//                           onChanged: (SfRangeValues values) {
//                             setState(() {
//                               priceRange = RangeValues(
//                                 values.start,
//                                 values.end,
//                               );
//                             });
//                           },
//                         ),
//                       ),
//
//                       SizedBox(height: 20.h),
//
//                       // Ratings
//                       _buildSectionTitle('Ratings'),
//                       SizedBox(height: 10.h),
//                       SizedBox(
//                         height: 35.h,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: ratings.length,
//                           itemBuilder: (context, index) {
//                             final rating = ratings[index];
//                             final isSelected = selectedRating == rating;
//                             return Padding(
//                               padding: EdgeInsets.only(right: 10.w),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     selectedRating = rating;
//                                   });
//                                 },
//                                 child: Container(
//                                   height: 30.h,
//                                   width: 70.w,
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 16.w,
//                                     vertical: 10.h,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: isSelected
//                                         ? Color(0xFFE8F5E9)
//                                         : Color(0xFFF6F8F9),
//                                     borderRadius: BorderRadius.circular(20.r),
//                                   ),
//                                   child: Center(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.star,
//                                           size: 15.sp,
//                                           color: isSelected
//                                               ? AppColors.kPrimaryColor
//                                               : AppColors.textGreyColor,
//                                         ),
//                                         SizedBox(width: 4.w),
//                                         Text(
//                                           rating,
//                                           style: TextStyle(
//                                             height: 0,
//                                             fontSize: 12.sp,
//                                             color: isSelected
//                                                 ? AppColors.kPrimaryColor
//                                                 : AppColors.textGreyColor,
//                                             fontWeight: isSelected
//                                                 ? FontWeight.w600
//                                                 : FontWeight.normal,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//
//                       SizedBox(height: 24.h),
//                     ],
//                   ),
//                 ),
//               ),
//
//               // Bottom Buttons
//               Container(
//                 padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 10,
//                       offset: Offset(0, -15),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     // Reset Button
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {
//                           setState(() {
//                             location = 'New York';
//                             selectedService = 'All';
//                             availability = '';
//                             priceRange = RangeValues(10, 100);
//                             selectedRating = 'All';
//                           });
//                           Navigator.pop(context);
//                         },
//                         style: OutlinedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(vertical: 14.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.r),
//                           ),
//                           side: BorderSide(color: Colors.grey[300]!),
//                         ),
//                         child: Text(
//                           'Reset',
//                           style: TextStyle(
//                             fontSize: 15.sp,
//                             color: Colors.black,
//                             height: 0,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 12.w),
//                     // Apply Button
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context, {
//                             'location': location,
//                             'service': selectedService,
//                             'availability': availability,
//                             'priceRange': priceRange,
//                             'rating': selectedRating,
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.kPrimaryColor,
//                           padding: EdgeInsets.symmetric(vertical: 14.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.r),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: Text(
//                           'Apply',
//                           style: TextStyle(
//                             fontSize: 15.sp,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(
//         height: 0,
//         fontSize: 14.sp,
//         fontWeight: FontWeight.w500,
//         color: AppColors.textBlackColor,
//       ),
//     );
//   }
// }
