import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/bottom_shadow_bar.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../models/ui/image_view.dart';
import '../view_models/professional_gopher_view_model.dart';
import '../widgets/bottomSheet/add_service_bottom_sheet.dart';
import '../widgets/bottomSheet/image_selection_bottom_sheet.dart';

class ProfessionalGopherOnboardingScreen extends StatefulWidget {
  const ProfessionalGopherOnboardingScreen({super.key});

  @override
  State<ProfessionalGopherOnboardingScreen> createState() =>
      _ProfessionalGopherOnboardingScreenState();
}

class _ProfessionalGopherOnboardingScreenState
    extends State<ProfessionalGopherOnboardingScreen> {
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
        title: 'Register Your Details',
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
            'Service Provider Information',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),

          Text(
            'Services',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor,
            ),
          ),
          SizedBox(height: 10.h),
          _selectedServicesWidget(),
          SizedBox(height: 16.h),

          _buildTextField(
            label: 'About us',
            hintText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis volutpat penatibus nullam elementum pulvinar lectus cras tempus iaculis. Ut nascetur elementum orci dictumst tempus tristique viverra aliquam dui. Semper eget lobortis pharetra facilisis cursus porttitor. Non, neque eget facilisis interdum molestie est.',
            maxLine: 7,
          ),
          SizedBox(height: 16.h),
          _buildPhotoSection(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _selectedServicesWidget() {
    return Consumer<ProfessionalGopherViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Dropdown
            GestureDetector(
              onTap: () => selectServiceBottomSheet(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: AppColors.textFieldFillColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.textFieldFillColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Service',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textGreyColor,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textGreyColor,
                    ),
                  ],
                ),
              ),
            ),

            // Selected Services List
            if (viewModel.selectedServices.isNotEmpty) ...[
              SizedBox(height: 16.h),
              ...viewModel.selectedServices.map((service) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  // padding: EdgeInsets.all(12.w),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      dashPattern: [5, 5],
                      strokeWidth: 1.5,
                      color: AppColors.kPrimaryColor,
                      radius: Radius.circular(10.r),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        children: [
                          // Service Icon
                          Container(
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: ClipOval(child: Image.asset(service.icon)),
                            ),
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

                          // Price
                          Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: AppColors.textFieldFillColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '\$${service.price}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '/hour',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // Delete Button
                          GestureDetector(
                            onTap: () => viewModel.removeService(service.id),
                            child: SvgPicture.asset(
                              SvgAssets.delete,
                              height: 20.w,
                              width: 20.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ],
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    int maxLine = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            height: 0,
            // fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          keyboardType: keyboardType,
          maxLines: maxLine,
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
            // contentPadding: EdgeInsets.all(
            //   horizontal: 16.w,
            //   vertical: 14.h,
            // ),
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
              onTap: () async {
                final path = await ImageSelectionBottomSheet.show(
                  context: context,
                );
                if (path != null) {
                  context.read<ProfessionalGopherViewModel>().addImage(path);
                }
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
            _buildImagesList(),
            // Uploaded Images
            // ...List.generate(
            //   3,
            //   (index) => Padding(
            //     padding: EdgeInsets.only(right: 10.w),
            //     child: Container(
            //       width: 65.w,
            //       height: 63.h,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(4.r),
            //         image: DecorationImage(
            //           image: AssetImage(DummyAssets.serviceDetail),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget _buildImagesList() {
    return Consumer<ProfessionalGopherViewModel>(
      builder: (context, viewModel, child) {
        return Wrap(
          children: List.generate(viewModel.bookingSharePics.length, (index) {
            return _buildImageItem(context, index, viewModel);
          }),
        );
      },
    );
  }

  Badge _buildImageItem(
    BuildContext context,
    int index,
    ProfessionalGopherViewModel viewModel,
  ) {
    return Badge(
      label: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          context.read<ProfessionalGopherViewModel>().removeImage(index);
        },
        child: Icon(Iconsax.close_square5, color: Colors.red),
      ),
      offset: Offset(-25, 5),
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          imageViewer,
          arguments: ImageView(
            file: viewModel.bookingSharePics[index],
            type: ImageType.file,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Container(
            width: 65.w,
            height: 63.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              image: DecorationImage(
                image: FileImage(File(viewModel.bookingSharePics[index])),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentUploadPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Additional Documents',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor,
            ),
          ),
          SizedBox(height: 12.h),
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [5, 5],
              strokeWidth: 1.5,
              color: AppColors.widgetBackColor,
              radius: Radius.circular(10.r),
            ),
            child: Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.kPrimaryColor,
                    ),
                    child: Icon(Icons.add, size: 24.sp, color: Colors.white),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Upload Documents',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Maximum file size: 2 MB',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            height: 120.h,

            ///  padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Image.asset(DummyAssets.serviceDetail),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            height: 120.h,

            ///  padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Image.asset(DummyAssets.serviceDetail),
          ),
        ],
      ),
    );
  }
}
