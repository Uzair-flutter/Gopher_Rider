import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textController;
  bool _showText = false;

  @override
  void initState() {
    super.initState();

    // Logo animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
      lowerBound: 0,
      upperBound: 1,
    );

    // Text blink animation controller
    _textController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    // Start logo animation
    _controller.forward(from: 0);

    // Listen for logo animation completion
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Show text and start blink animation
        setState(() {
          _showText = true;
        });
        _startBlinkAnimation();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 2000));
      if (mounted) {
        Navigator.pushReplacementNamed(context, launchScreen);
      }
    });
  }

  void _startBlinkAnimation() async {
    // Blink effect: fade in, out, in
    await _textController.forward(from: 0);
    // await _textController.reverse();
    // await _textController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    return Scaffold(
      backgroundColor: AppColors.kSecondaryColor,
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Animation
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final value = _controller.value;
                  return Transform.scale(
                    scale: value,
                    child: SizedBox(
                      height: 180.h,
                      width: width * 0.6,
                      child: Image.asset(PngAssets.logo),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: _showText
                  ? AnimatedBuilder(
                      animation: _textController,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _textController.value,
                          child: Text(
                            'GOPHER',
                            style: TextStyle(
                              fontSize: 49.95.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox(height: 40.sp), // Placeholder to maintain layout
            ),
          ],
        ),
      ),
    );
  }
}
