import 'dart:async';
import 'package:flutter/material.dart';

class ScrollingImagesModel {
  PageController pageController = PageController();
  Timer? timer;
  int currenImage = 0;
  Color dotColor = Colors.yellow;
}
