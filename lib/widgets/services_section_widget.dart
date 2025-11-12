import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/service_item_widget.dart';

class ServicesSection extends StatelessWidget {
  final List<ServiceItem> services;
  final VoidCallback? onViewAll;

  const ServicesSection({super.key, required this.services, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          // Services Grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 18.h,
              childAspectRatio: 0.85,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return ServiceItemWidget(service: services[index]);
            },
          ),
        ],
      ),
    );
  }
}
