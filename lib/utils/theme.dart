import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constant.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.kPrimaryColor,
        brightness: Brightness.light,
      ),
    ).copyWith(
      brightness: Brightness.light,

      // primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.inter(
          textStyle: TextStyle(color: AppColors.blackColor, fontSize: 16.sp),
        ),
        elevation: 0,
        // centerTitle: true,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      // Text Selection Theme for cursor color
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.kPrimaryColor, // Cursor color
      ),

      iconTheme: const IconThemeData(color: Colors.black54),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        side: BorderSide.none,
      ),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        checkColor: WidgetStatePropertyAll(Colors.white),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kPrimaryColor;
          }
          return null;
        }),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            height: 0,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 19.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.textFieldFillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        errorStyle: TextStyle(fontSize: 11.sp, overflow: TextOverflow.visible),
        errorMaxLines: 2,

        hintStyle: TextStyle(
          height: 0,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.textFieldFillColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.textFieldFillColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.textFieldFillColor),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        dragHandleColor: Color(0xffCDCFD0),
        backgroundColor: Colors.white,
        dragHandleSize: Size(48.w, 5.h),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue[400],
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      iconTheme: const IconThemeData(color: Colors.white70),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[400],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
