import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class Detailload extends StatelessWidget {
  const Detailload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Lottie.asset('assets/lottie/lf20_gg64dbs8.json'),
      ),
    );
  }
}