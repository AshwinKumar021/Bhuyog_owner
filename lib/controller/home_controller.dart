import 'dart:async';

import 'package:changin/utils/helper/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Timer?> getTimer = Timer(const Duration(seconds: 1), () {}).obs;
  Rx<TextEditingController> timeContoller = TextEditingController().obs;
  void startTimer() {
    getTimer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      logger.i(timer.tick.seconds);
      timeContoller.value =
          TextEditingController(text: getTimer.value.toString());
    });
  }

  void stopTimer() {
    getTimer.value?.cancel();
  }
}
