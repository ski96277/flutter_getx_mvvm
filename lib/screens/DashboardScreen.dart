import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resono/controller/dashboardScreenController.dart';
import 'package:resono/data/response/status.dart';
import 'package:resono/utlis/textStyle.dart';
import 'package:resono/weidget/CustomTextView.dart';
import 'package:resono/weidget/LoadingOverlay.dart';
import 'package:resono/weidget/ResponsiveWidget.dart';
import 'package:resono/weidget/customAppbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(builder: (controller) {
      return ResponsiveWidget(
        largeScreen: dashboardWebViewDesign(controller),
        mediumScreen: dashboardTabletViewDesign(controller),
        smallScreen: dashboardMobileViewDesign(controller),
      );
    });
  }
}

Widget dashboardWebViewDesign(DashboardScreenController controller) {
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

Widget dashboardTabletViewDesign(DashboardScreenController controller) {
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

Widget dashboardMobileViewDesign(DashboardScreenController controller) {
  return Scaffold(
    appBar:  AppBar(),
    body: Center(
      child: ListView(
        children: [
          LoadingOverlay(
            isLoading: controller.users?.status == Status.LOADING,
            child: Container(
              color: Colors.lightGreen,
              child: CustomTextView(text: 'mobileView'.tr, style: textTheme.displaySmall),
            ),
          ),
        ],
      ),
    ),
  );
}
