import 'package:flutter/material.dart';
import 'package:get/get.dart';

double fontSize({required double size}) {
  return MediaQuery.of(Get.context!).size.width * (size/100);
}