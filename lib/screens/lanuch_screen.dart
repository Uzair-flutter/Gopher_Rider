import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Deliver with Ease',
      description:
          'Deliver fast, earn on your own schedule, and get paid for your time with complete flexibility!',
      buttonText: 'Next',
    ),
    OnboardingPage(
      title: 'Join as a Gopher Rider',
      description:
          'Deliver at your own pace, earn on your terms, and enjoy the freedom of being your own boss!',
      buttonText: 'Next',
    ),
    OnboardingPage(
      title: 'Drive. Deliver. Earn.',
      description:
          'Take control of your schedule, deliver efficiently, and get paid for every job you complete!',
      buttonText: 'Get Started',
    ),
  ];

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

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 65.h,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (_currentPage < 2)
            Padding(
              padding: EdgeInsets.only(top: 24.h, right: 24.0.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    loginScreen,
                    (route) => false,
                  );
                },
                child: _buildSkipButton(),
              ),
            ),
        ],
      ),
      // Dark gray background
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),

        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _buildPage(_pages[index], index);
        },
      ),
    );
  }

  Widget _buildPage(OnboardingPage page, int index) {
    return Column(
      children: [
        // Image area - takes most of the screen
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),

              // You can add your actual images here
              // image: DecorationImage(
              //   image: AssetImage('path_to_image'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Image.asset(
              index == 0
                  ? PngAssets.launch1
                  : index == 1
                  ? PngAssets.launch2
                  : PngAssets.launch3,
              fit: BoxFit.fill,
            ),
          ),
        ),
        // White content card
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(bottom: 24.w, top: 58.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // Title
                      Text(
                        page.title,
                        style: GoogleFonts.inter(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      // Description
                      Text(
                        page.description,
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textBlackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      // Pagination indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (index) => _buildDot(index == _currentPage),
                        ),
                      ),
                    ],
                  ),
                  // CTA Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextPage,

                      child: Text(page.buttonText),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      width: 20.w,
      height: 4.h,
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
}

class OnboardingPage {
  final String title;
  final String description;
  final String buttonText;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.buttonText,
  });
}
