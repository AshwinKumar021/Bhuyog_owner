import 'package:bot_toast/bot_toast.dart';
import 'package:changin/app_config/app_config.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/utils/style/theme.dart';
import 'package:changin/view/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Style.colors.white,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
        ));
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConfig.APP_NAME,
          theme: appThemeData,
          home: const OnBoardingPage(),
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
        );
      },
    );
  }
}
