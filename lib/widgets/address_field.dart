import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'labeled_text_field.dart';

class AddressField extends StatelessWidget {
  final String heading;
  const AddressField({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            height: 0,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        LabeledTextField(label: 'Full Address', hint: 'Enter Full Address'),
        Row(
          spacing: 16.w,
          children: [
            Expanded(
              child: LabeledTextField(label: 'Street', hint: 'Enter Street'),
            ),
            Expanded(
              child: LabeledTextField(
                label: 'Floors (Optional)',
                hint: 'Enter Floor',
              ),
            ),
          ],
        ),
        LabeledTextField(
          label: 'Nearby Landmark',
          hint: 'Enter Nearby Landmark',
        ),
      ],
    );
  }
}
