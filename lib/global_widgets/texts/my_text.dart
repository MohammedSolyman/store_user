import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.txt, {
    super.key,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: Theme.of(context).textTheme.bodyLarge);
  }
}

class MyTextHead extends StatelessWidget {
  const MyTextHead(
    this.txt, {
    super.key,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          backgroundColor: Theme.of(context).primaryColorDark,
          color: Colors.white),
    );
  }
}
