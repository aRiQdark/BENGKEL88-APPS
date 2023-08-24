import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class middleload extends StatelessWidget {
  const middleload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Lottie.asset('assets/lottie/dlf10_lZZX75saS2.json'),
      ),
    );
  }
}