// app_init.dart
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gophar_rider/route_generator.dart';
import 'package:gophar_rider/utils/screen_size.dart';
import 'package:gophar_rider/utils/theme.dart';
import 'package:gophar_rider/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;
    return ScreenUtilInit(
      designSize: getDesignSize(context: context),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gopher SP',
          initialRoute: splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
          // home: WalletTransactionScreen(),
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,
        );
      },
    );
  }
}
