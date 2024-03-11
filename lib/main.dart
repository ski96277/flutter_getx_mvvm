import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resono/binding/view_model_binding.dart';
import 'package:resono/utlis/text_const.dart';
import 'package:resono/routes/app_pages.dart';
import 'package:resono/routes/app_routes.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return GetMaterialApp(
      showPerformanceOverlay: kDebugMode ? true : false,
      translations: TextConst(),
      locale: const Locale('en', 'UK'),
      // translations will be displayed in that locale
      initialBinding: ViewModelBinding(),
      title: 'Resono',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.initRoute,
      getPages: AppPages.list,
    );
  }
}
