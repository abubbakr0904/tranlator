import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/screens/translate_screen/translate_screen.dart';
import 'package:translate/utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => const TranslateScreen()),
        (route) => false);
  }

  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Stack(
        children: [
          Image.asset(AppImages.splashBg,
              width: double.infinity, fit: BoxFit.cover),
          Center(
              child:
                  Image.asset(AppImages.logo, width: 200.w, fit: BoxFit.cover))
        ],
      ),
    ));
  }
}
