import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/assets.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/utils/enums.dart';
import 'package:gophar_rider/utils/string_utils.dart';
import 'package:gophar_rider/view_models/service_view_model.dart';
import 'package:gophar_rider/widgets/address_field.dart';
import 'package:gophar_rider/widgets/bottom_shadow_bar.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class DeliveryFormScreen extends StatelessWidget {
  const DeliveryFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
            context.read<ServiceViewModel>().selectedGopherType !=
                GopherType.rider
            ? 'Delivery'
            : 'Rider',
      ),
      body: SafeArea(child: _buildBody(context)),
      bottomNavigationBar: BottomShadowBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, deliveryScreen);
          },
          child: Text('Continue'),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 24.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            AddressField(heading: 'Pickup Details'),
            AddressField(heading: 'Dropoff Details'),
            if (context.read<ServiceViewModel>().selectedGopherType !=
                GopherType.rider)
              _buildWhatToDeliver(context),
            if (context.read<ServiceViewModel>().selectedGopherType !=
                GopherType.rider)
              _buildCategories(context),
            _buildCommentsForGophet(context),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Wrap _buildCategories(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: List.generate(DeliveryCategory.values.length, (index) {
        final category = DeliveryCategory.values[index];
        final selectedCategories = context
            .select<ServiceViewModel, List<DeliveryCategory>>(
              (viewModel) => viewModel.categories,
            );
        final bool isSelected = selectedCategories.contains(category);
        return GestureDetector(
          onTap: () {
            context.read<ServiceViewModel>().setCategory(category);
          },
          child: Chip(
            avatar: isSelected
                ? Icon(Icons.add, color: AppColors.kPrimaryColor, size: 16.sp)
                : null,
            label: Text(category.name.capitalize),
            backgroundColor: isSelected
                ? AppColors.primaryAccent
                : AppColors.textFieldFillColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            side: BorderSide.none,
            labelStyle: TextStyle(
              color: isSelected ? AppColors.kPrimaryColor : null,
              fontSize: 12.sp,
            ),
          ),
        );
      }),
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
          'What to deliver?',
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
              child: SizedBox(
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

  Widget _buildCommentsForGophet(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comments for Gopher',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        TextFormField(
          minLines: 4,
          maxLines: 4,
          decoration: InputDecoration(hintText: 'Comments'),
        ),
      ],
    );
  }
}
