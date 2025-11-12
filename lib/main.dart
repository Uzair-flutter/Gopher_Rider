import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gophar_rider/view_models/address_view%20provider.dart';
import 'package:provider/provider.dart';

import 'app_init.dart';
import 'services/storage_service.dart';
import 'view_models/bottom_nav_view_model.dart';
import 'view_models/service_view_model.dart';
import 'view_models/theme_view_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize StorageService before creating providers
  await StorageService().init();
  await GoogleFonts.pendingFonts([GoogleFonts.inter()]);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
        ChangeNotifierProvider(create: (context) => BottomNavViewModel()),
        ChangeNotifierProvider(create: (_) => ServiceViewModel()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
      ],
      child: AppInit(),
    ),
  );
}
