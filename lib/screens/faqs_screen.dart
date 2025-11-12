import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/utils/color_constant.dart';
import 'package:gophar_rider/widgets/custom_app_bar.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "FAQ's"),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0.h),
              Text(
                "We’re here to help you",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                ),
              ),
              SizedBox(height: 16.0.h),
              Text(
                "Please check our FAQ’s below if you’ve any issue regarding our app guide and usage",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreyColor,
                ),
              ),
              SizedBox(height: 24.h),
              customExpansionCard(
                context: context,
                title: "Lorem ipsum dolor sit amet",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 20.h),
              customExpansionCard(
                context: context,
                title: "Lorem ipsum dolor sit amet",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 20.h),
              customExpansionCard(
                context: context,
                title: "Lorem ipsum dolor sit amet",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 20.h),
              customExpansionCard(
                context: context,
                title: "Lorem ipsum dolor sit amet",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
              SizedBox(height: 20.h),
              customExpansionCard(
                context: context,
                title: "Lorem ipsum dolor sit amet",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customExpansionCard({
  required BuildContext context,
  required String title,
  required String description,
}) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.zero,
    child: Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          iconColor: AppColors.kPrimaryColor,
          collapsedIconColor: AppColors.kPrimaryColor,
          maintainState: true,
          shape: Border.all(color: Colors.transparent),
          tilePadding: EdgeInsets.symmetric(horizontal: 12.w),
          childrenPadding: EdgeInsets.zero,
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text(description)),
          ],
        ),
      ),
    ),
  );
}
