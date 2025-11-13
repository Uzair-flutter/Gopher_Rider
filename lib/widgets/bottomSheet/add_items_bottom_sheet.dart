import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/view_models/ride_view_model.dart';
import 'package:provider/provider.dart';

class Item {
  final String name;
  final String price;

  Item({required this.name, required this.price});
}

void addItemBottomSheet(BuildContext context) {
  final itemProvider = Provider.of<RideViewModel>(context, listen: false);

  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(minWidth: double.infinity),
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20.w,
              right: 20.w,
              top: 10.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Add Items",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Divider(color: AppColors.textFieldFillColor, thickness: 2.h),
                  SizedBox(height: 20.h),
                  Text('Item Name'),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: itemProvider.nameController,
                    decoration: InputDecoration(hintText: 'Enter Item Name'),
                  ),
                  SizedBox(height: 20.h),
                  Text('Item Price'),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: itemProvider.priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Price'),
                  ),
                  SizedBox(height: 20.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (itemProvider.nameController.text.isNotEmpty &&
                            itemProvider.priceController.text.isNotEmpty) {
                          itemProvider.addItem(
                            itemProvider.nameController.text,
                            '\$${itemProvider.priceController.text}',
                          );
                          itemProvider.clearControllers();
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Add"),
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
