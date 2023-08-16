import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/models/scrolling_images_model.dart';

class ScrollingImagesController extends GetxController {
  Rx<ScrollingImagesModel> scrollingImagesModel = ScrollingImagesModel().obs;

  void updateCurrentPage(int newPage) {
    scrollingImagesModel.update((val) {
      val!.currenImage = newPage;
    });
  }

  void updateDotColor({required int dotIndex}) {
    if (scrollingImagesModel.value.currenImage == dotIndex) {
      scrollingImagesModel.update((val) {
        val!.dotColor = Colors.red;
      });
    } else {
      scrollingImagesModel.update((val) {
        val!.dotColor = Colors.yellow;
      });
    }
  }

  _startScrolling() {
    int x = 10;
    int y = 10;
    int z;

    scrollingImagesModel.value.timer =
        Timer.periodic(const Duration(seconds: 2), (timer) {
      z = y % x;
      scrollingImagesModel.value.pageController.jumpToPage(z);
      y++;
    });
  }

  _stopScrolling() {
    scrollingImagesModel.value.timer!.cancel();
  }

  @override
  void onInit() {
    super.onInit();
    _startScrolling();
  }

  @override
  void onClose() {
    super.onClose();
    _stopScrolling();
  }
}
