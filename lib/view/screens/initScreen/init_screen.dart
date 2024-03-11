import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resono/services/response/status.dart';
import 'package:resono/utlis/textStyle.dart';
import 'package:resono/view/screens/initScreen/controller/initScreenController.dart';
import 'package:resono/view/weidget/CustomTextView.dart';
import 'package:resono/view/weidget/LoadingOverlay.dart';
import 'package:resono/view/weidget/ResponsiveWidget.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitScreenController>(builder: (controller) {
      return ResponsiveWidget(
        largeScreen: dashboardWebViewDesign(controller),
        mediumScreen: dashboardTabletViewDesign(controller),
        smallScreen: dashboardMobileViewDesign(controller),
      );
    });
  }
}

Widget dashboardWebViewDesign(InitScreenController controller) {
  return Scaffold(
    appBar:  AppBar(),
    body: Center(
      child: ListView(
        children: [
          LoadingOverlay(
            isLoading: controller.users?.status == Status.LOADING,
            child: Container(
              color: Colors.lightGreen,
              child: CustomTextView(text: 'desktopView'.tr, style: textTheme.displaySmall),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dashboardTabletViewDesign(InitScreenController controller) {
  return Scaffold(
    appBar:  AppBar(),
    body: Center(
      child: ListView(
        children: [
          LoadingOverlay(
            isLoading: controller.users?.status == Status.LOADING,
            child: Container(
              color: Colors.lightGreen,
              child: CustomTextView(text: 'tabletView'.tr, style: textTheme.displaySmall),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dashboardMobileViewDesign(InitScreenController controller) {
  return Scaffold(
    appBar:  AppBar(),
    body: Center(
      child: ListView(
        children: [
          LoadingOverlay(
            isLoading: controller.users?.status == Status.LOADING,
            child: Container(
              height: Get.height,
              color: Colors.lightGreen,
              child: Center(child: CustomTextView(text: 'mobileView'.tr, style: textTheme.displaySmall)),
            ),
          ),
        ],
      ),
    ),
  );
}
