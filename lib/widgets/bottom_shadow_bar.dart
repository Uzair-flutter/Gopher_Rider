import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomShadowBar extends StatelessWidget {
  final Widget child;
  const BottomShadowBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(20, 0),
            blurRadius: 74,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.15),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(padding: EdgeInsets.all(24.h), child: child),
    );
  }
}
