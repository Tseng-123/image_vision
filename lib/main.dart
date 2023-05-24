import 'package:flutter/material.dart';
import 'package:xiaoyan_web/i10n/messages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xiaoyan_web/pages/home_page.dart';
import 'package:xiaoyan_web/pages/picture_edit.dart';
import 'package:xiaoyan_web/pages/pink_cake.dart';
import 'package:xiaoyan_web/pages/unknown_route_page.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(820, 1180),
        builder: (context, child) => GetMaterialApp(
            unknownRoute: GetPage(
                name: '/notFound', page: () => const UnKnownRoutePage()),
            routingCallback: (value) {},
            translations: Messages(),
            locale: ui.window.locale,
            fallbackLocale: const Locale("zh"),
            title: 'xiaoyan'.tr,
            home: const PictureEditPage()),
        // home: const HomePage()),
      ),
    );
  }
}
