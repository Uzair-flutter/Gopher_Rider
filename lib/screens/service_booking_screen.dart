import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/screens/your_address_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/bottom_shadow_bar.dart';
import '../widgets/custom_app_bar.dart';

class ServiceBookingScreen extends StatefulWidget {
  const ServiceBookingScreen({super.key});

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<String> uploadedImages = [];
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'House Cleaning', isBackButtonVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateField(),
            SizedBox(height: 20.h),
            _buildTimeField(),
            SizedBox(height: 20.h),
            _buildPhotoSection(),
            SizedBox(height: 20.h),
            _buildDescriptionField(),
            // SizedBox(height: 30.h), // Space for bottom bar
          ],
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YourAddressScreen()),
            );
          },
          child: Text('Continue'),
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date',
          style: TextStyle(
            height: 0,
            color: AppColors.textBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              builder: (BuildContext context, Widget? child) {
                // Customizing the calendar theme color
                return Theme(
                  data: ThemeData.light().copyWith(
                    dialogBackgroundColor: Color(
                      0xFFEEEFF3,
                    ), // Calendar background color
                  ),
                  child: child!,
                );
              },
            );

            if (picked != null) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
          child: Container(
            width: double.infinity,
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.textFieldFillColor,
              border: Border.all(color: Color(0xFFEEEFF3)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? 'Enter Date'
                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                  style: TextStyle(
                    height: 0,
                    color: selectedDate == null
                        ? AppColors.textGreyColor
                        : AppColors.textBlackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Iconsax.calendar,
                  size: 24.sp,
                  color: AppColors.textGreyColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Time',
          style: TextStyle(
            height: 0,
            color: AppColors.textBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),

              builder: (BuildContext context, Widget? child) {
                // Customizing the calendar theme color
                return Theme(
                  data: ThemeData.light().copyWith(
                    dialogBackgroundColor: Color(
                      0xFFEEEFF3,
                    ), // Calendar background color
                  ),
                  child: child!,
                );
              },
            );

            if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Container(
            width: double.infinity,
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.textFieldFillColor,
              border: Border.all(color: Color(0xFFEEEFF3)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTime == null
                      ? 'Enter Time'
                      : selectedTime!.format(context),
                  style: TextStyle(
                    height: 0,
                    color: selectedTime == null
                        ? AppColors.textGreyColor
                        : AppColors.textBlackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.access_time,
                  size: 24.sp,
                  color: AppColors.textGreyColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Are there any photos you\'d like to share?',
          style: TextStyle(
            height: 0,
            color: AppColors.textBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            // Upload Button
            GestureDetector(
              onTap: () {
                // Handle image picker
                debugPrint('Pick image');
              },
              child: Container(
                width: 65.w,
                height: 63.h,
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  border: Border.all(color: Color(0xFFEEEFF3)),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 28.sp,
                        color: AppColors.textGreyColor,
                      ),
                    ),
                    Positioned(
                      right: 8.w,
                      top: 8.h,
                      child: Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),

            // Uploaded Images
            ...List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Container(
                  width: 65.w,
                  height: 63.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    image: DecorationImage(
                      image: AssetImage(DummyAssets.serviceDetail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Describe your service',
          style: TextStyle(
            height: 0,
            color: AppColors.textBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          //  padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: AppColors.textFieldFillColor,
            border: Border.all(color: Color(0xFFEEEFF3)),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextFormField(
            controller: descriptionController,
            maxLines: 7,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8.w),
              hintText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis volutpat penatibus nullam elementum pulvinar lectus cras tempus iaculis.',
              hintStyle: TextStyle(
                color: AppColors.textGreyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 74,
            offset: Offset(20, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  height: 0,
                  color: AppColors.textGreyColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                '\$74',
                style: TextStyle(
                  height: 0,
                  color: AppColors.textBlackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          // Continue Button
          GestureDetector(
            onTap: () {
              // Handle continue
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YourAddressScreen()),
              );
            },
            child: Container(
              width: 210.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kPrimaryColor.withOpacity(0.16),
                    blurRadius: 12,
                    offset: Offset(0, 12),
                    spreadRadius: -8,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    height: 0,
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}
