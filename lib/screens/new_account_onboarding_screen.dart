import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../view_models/service_view_model.dart';
import '../widgets/bottom_shadow_bar.dart';

class NewAccountOnboardingScreen extends StatefulWidget {
  const NewAccountOnboardingScreen({super.key});

  @override
  State<NewAccountOnboardingScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<NewAccountOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool check = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(
        context,
      ); // This will pop the current screen and go back to the previous one.
    }
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, successfullyCreatedScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Delivery Driver Signup',
        isBackButtonVisible: true,
      ),
      // Dark gray background
      body: SafeArea(
        child: Column(
          children: [
            Text('Let’s create your account.'),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => _buildDot(index == _currentPage),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildPage([index], index);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomShadowBar(
          child: _currentPage == 1
              ? Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.textBlackColor,
                          backgroundColor: Color(0xffF6F8F9), // Text color
                          side: BorderSide(
                            color: Color(0xffF6F8F9),
                          ), // Border color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ), // Border radius for the button
                          ),
                        ),
                        onPressed: () {
                          _previousPage();
                        },
                        child: Text('Back'),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _nextPage();
                        },
                        child: Text('Next'),
                      ),
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    _nextPage();
                  },
                  child: Text(_currentPage < 2 ? 'Next' : 'Submit'),
                ),
        ),
      ),
    );
  }

  Widget _buildPage(page, int index) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20.w),
        child: switch (_currentPage) {
          0 => _buildPersonalInformationPage(),
          1 => _buildVehicleInformationPage(),
          2 => _buildDocumentUploadPage(),
          int() => SizedBox.shrink(),
        },
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 98.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.kPrimaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Skip',
            style: GoogleFonts.inter(
              height: 0,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.kSecondaryColor,
            ),
          ),
          SizedBox(width: 6.w),
          Icon(
            Iconsax.arrow_right_1,
            size: 18.sp,
            color: AppColors.kSecondaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInformationPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 24.h),

          // Upload Image Section
          Text(
            'Upload Image',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [10, 5],
              strokeWidth: 2,
              color: Color(0xFF757273),
              radius: Radius.circular(10.r),
            ),
            child: Container(
              width: 142.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(SvgAssets.upload, width: 24.w, height: 24.h),
                  SizedBox(height: 5.h),
                  Text(
                    'Upload',
                    style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Maximum file size: 2 MB',
                    style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),

          // Full Name
          _buildTextField(label: 'Full Name', hintText: 'John Doe'),
          SizedBox(height: 20.h),

          // Email Address
          _buildTextField(
            label: 'Email Address',
            hintText: 'john.doe@email.com',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.h),

          // Phone Number
          Text(
            'Phone Number',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Text('🇺🇸', style: TextStyle(fontSize: 20.sp)),
                      SizedBox(width: 8.w),
                      Text(
                        '+1',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '+1 234-567-8901',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 14.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Home Address
          _buildTextField(
            label: 'Home Address',
            hintText: '123 Main St, Springfield',
          ),
          // SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildVehicleInformationPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicle Information',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 24.h),

          // Upload Vehicle Image
          Text(
            'Upload Vehicle Image',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [10, 5],
              strokeWidth: 2,
              color: Color(0xFF757273),
              radius: Radius.circular(10.r),
            ),
            child: Container(
              width: 142.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(SvgAssets.upload, width: 24.w, height: 24.h),
                  SizedBox(height: 5.h),
                  Text(
                    'Upload',
                    style: GoogleFonts.inter(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Maximum file size: 2 MB',
                    style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),

          _buildTextField(label: 'Vehicle Type', hintText: 'Motercycle'),
          SizedBox(height: 20.h),

          _buildTextField(
            label: 'Vehicle Make/Model',
            hintText: 'Yamaha YZF-R3',
          ),
          SizedBox(height: 20.h),

          _buildTextField(
            label: 'Vehicle Registration Number',
            hintText: 'ABC1234XYZ',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20.h),

          _buildTextField(
            label: 'Insurance Details',
            hintText: 'Valid until December 2025',
          ),
          SizedBox(height: 20.h),
          _buildWhatToDeliver(context),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            // fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              fontSize: 14.sp,
              color: AppColors.textGreyColor,
            ),
            filled: true,
            fillColor: AppColors.textFieldFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.kPrimaryColor,
                width: 1.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentUploadPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Document Upload',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 24.h),

          _buildTextField(label: 'License Number', hintText: 'D1234567'),
          SizedBox(height: 24.h),

          _buildTextField(label: 'License Number', hintText: 'D1234567'),
          SizedBox(height: 24.h),

          _buildTextField(label: 'License Number', hintText: 'D1234567'),
          SizedBox(height: 24.h),

          _buildTextField(label: 'License Number', hintText: 'D1234567'),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                side: BorderSide(color: AppColors.kPrimaryColor, width: 2),
                value: check,
                onChanged: (value) {
                  setState(() {
                    check = value!;
                  });
                },
              ),
              SizedBox(width: 8.w),
              Text('I agree to the terms and conditions'),
            ],
          ),

          // Upload Insurance
          // Text(
          //   'Upload Insurance',
          //   style: GoogleFonts.inter(
          //     fontSize: 14.sp,
          //     fontWeight: FontWeight.w500,
          //     color: Colors.black,
          //   ),
          // ),
          // SizedBox(height: 12.h),
          // Container(
          //   width: double.infinity,
          //   height: 120.h,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //     borderRadius: BorderRadius.circular(8.r),
          //     border: Border.all(color: Colors.grey[300]!),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.cloud_upload_outlined,
          //         size: 32.sp,
          //         color: Colors.grey[600],
          //       ),
          //       SizedBox(height: 8.h),
          //       Text(
          //         'Upload',
          //         style: GoogleFonts.inter(
          //           fontSize: 14.sp,
          //           fontWeight: FontWeight.w500,
          //           color: Colors.grey[700],
          //         ),
          //       ),
          //       SizedBox(height: 4.h),
          //       Text(
          //         'Maximum file size: 2 MB',
          //         style: GoogleFonts.inter(
          //           fontSize: 12.sp,
          //           fontWeight: FontWeight.w400,
          //           color: Colors.grey[500],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 24.h),
          //
          // // Upload Registration
          // Text(
          //   'Upload Vehicle Registration',
          //   style: GoogleFonts.inter(
          //     fontSize: 14.sp,
          //     fontWeight: FontWeight.w500,
          //     color: Colors.black,
          //   ),
          // ),
          // SizedBox(height: 12.h),
          // Container(
          //   width: double.infinity,
          //   height: 120.h,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //     borderRadius: BorderRadius.circular(8.r),
          //     border: Border.all(color: Colors.grey[300]!),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.cloud_upload_outlined,
          //         size: 32.sp,
          //         color: Colors.grey[600],
          //       ),
          //       SizedBox(height: 8.h),
          //       Text(
          //         'Upload',
          //         style: GoogleFonts.inter(
          //           fontSize: 14.sp,
          //           fontWeight: FontWeight.w500,
          //           color: Colors.grey[700],
          //         ),
          //       ),
          //       SizedBox(height: 4.h),
          //       Text(
          //         'Maximum file size: 2 MB',
          //         style: GoogleFonts.inter(
          //           fontSize: 12.sp,
          //           fontWeight: FontWeight.w400,
          //           color: Colors.grey[500],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildWhatToDeliver(BuildContext context) {
    final ServiceViewModel viewModel = context.watch();
    final int? selectedWeight = viewModel.selectedDeliveryWeight;
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weight Limit',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Row(
          spacing: 16.w,
          children: List.generate(3, (index) {
            final int weight = (index + 1) * 5;
            final String asset = switch (weight) {
              5 => PngAssets.upto5Kg,
              10 => PngAssets.upto10Kg,
              15 => PngAssets.upto15Kg,
              int() => throw UnimplementedError(),
            };
            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: 160.h,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.r),
                  onTap: () => viewModel.setDeliveryWeight(weight),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: AppColors.textFieldFillColor,
                      border: Border.all(
                        color: selectedWeight == weight
                            ? AppColors.kSecondaryColor
                            : AppColors.textFieldFillColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),

                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        Expanded(child: Image.asset(asset)),
                        Text(
                          'upto $weight kg',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
