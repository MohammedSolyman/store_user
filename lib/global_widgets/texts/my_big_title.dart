import 'package:flutter/material.dart';

class MyBigTitle extends StatelessWidget {
  const MyBigTitle(
    this.txt, {
    super.key,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: Theme.of(context).textTheme.titleLarge);
  }
}
