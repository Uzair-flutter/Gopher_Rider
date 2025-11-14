import 'package:flutter/material.dart';
import 'package:gophar_rider/main.dart';
import 'package:gophar_rider/screens/home_screen.dart';
import 'package:gophar_rider/screens/notification_screen.dart';
import 'package:gophar_rider/screens/professional_gopher/home_screen_pg.dart';
import 'package:gophar_rider/screens/setting_screen.dart';
import 'package:provider/provider.dart';

import '../utils/enums.dart';
import '../view_models/bottom_nav_view_model.dart';
import '../view_models/service_view_model.dart';
import '../widgets/bottom_nav_bar.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  static final List<Widget> _children = [
    navigatorKey.currentContext?.read<ServiceViewModel>().selectedGopherType !=
            GopherType.rider
        ? const HomeScreenPg()
        : const HomeScreen(),
    const Scaffold(body: Center(child: Text('Job Screen'))),
    const NotificationScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          body: _children[provider.currentPage],
          extendBody: true,
          // floatingActionButton: Visibility(
          //   visible: MediaQuery.viewInsetsOf(context).bottom == 0,
          //   child: SizedBox(
          //     height: 55.h,
          //     width: 55.h,
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.pushNamed(context, selectServiceScreen);
          //       },
          //       child: Card(
          //         color: AppColors.kPrimaryColor,
          //         elevation: 0,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(100),
          //           side: BorderSide(color: Colors.white, width: 3.r),
          //         ),
          //         child: Icon(Icons.add, size: 24.sp, color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
