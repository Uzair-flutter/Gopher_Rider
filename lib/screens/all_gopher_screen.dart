import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

import '../utils/assets.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/gopher_tile_widget.dart';

class AllGopherScreen extends StatelessWidget {
  const AllGopherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Gopher',
        showSearchIcon: true,
        actionIcon: SvgAssets.filter,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            CustomSearchBar(),
            SizedBox(height: 18.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 10.h),
                itemCount: gophers.length,
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemBuilder: (context, index) {
                  return GopherTile(
                    gopher: gophers[index],
                    onTap: () async {
                      // final filters = await FilterBottomSheet.show(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
