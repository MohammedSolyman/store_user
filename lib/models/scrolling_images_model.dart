import 'dart:async';
import 'package:flutter/material.dart';

class ScrollingImagesModel {
  PageController pageController = PageController();
  Timer? timer;
  int? currenImage;
  Color dotColor = Colors.yellow;
}
