import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../view_models/address_view provider.dart';
import '../widgets/bottom_shadow_bar.dart';
import '../widgets/custom_app_bar.dart';

class ConfirmAddressScreen extends StatefulWidget {
  const ConfirmAddressScreen({super.key});

  @override
  State<ConfirmAddressScreen> createState() => _ConfirmAddressScreenState();
}

class _ConfirmAddressScreenState extends State<ConfirmAddressScreen> {
  final TextEditingController fullAddressController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController floorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Confirm Address', isBackButtonVisible: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Map Section
            Container(
              // width: double.infinity,
              // height: 250.h,
              decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
              child: Center(
                child: Image.asset(
                  DummyAssets.map,
                  fit: BoxFit.cover,
                  height: 200.h,
                ),
              ),
            ),

            // Form Section
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    label: 'Full Address',
                    controller: fullAddressController,
                    hint: 'Enter',
                  ),
                  SizedBox(height: 20.h),
                  _buildTextField(
                    label: 'Street',
                    controller: streetController,
                    hint: 'Enter',
                  ),
                  SizedBox(height: 20.h),
                  _buildTextField(
                    label: 'Nearby Landmark',
                    controller: landmarkController,
                    hint: 'Enter',
                  ),
                  SizedBox(height: 20.h),
                  _buildTextField(
                    label: 'Floors (optional)',
                    controller: floorController,
                    hint: 'Enter',
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            _saveAddress();
          },
          child: Text('Save Address'),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            height: 0,
            color: AppColors.textBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.w),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.textGreyColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),

          style: TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  void _saveAddress() {
    if (fullAddressController.text.isEmpty ||
        streetController.text.isEmpty ||
        landmarkController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    final newAddress = AddressModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title:
          'Home ${Provider.of<AddressProvider>(context, listen: false).addresses.length + 1}',
      fullAddress: fullAddressController.text,
      street: streetController.text,
      landmark: landmarkController.text,
      floor: floorController.text.isEmpty ? null : floorController.text,
      isSelected: false,
    );

    Provider.of<AddressProvider>(context, listen: false).addAddress(newAddress);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    fullAddressController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    floorController.dispose();
    super.dispose();
  }
}

// Triangle Painter for location pin
class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
