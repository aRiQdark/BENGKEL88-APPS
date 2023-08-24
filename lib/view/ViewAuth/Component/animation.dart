import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

Widget animation(
  int index,
  int delay,
  Widget child,
) {
  if (index == 1) {
    return FadeInDown(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
  return FadeInUp(
    delay: Duration(milliseconds: delay),
    child: child,
  );
}
