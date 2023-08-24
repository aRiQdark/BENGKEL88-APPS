import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BarangJamtangan extends StatelessWidget {
  const BarangJamtangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin:const EdgeInsets.only(
        left: 10
      ),
      height: 70,
      width: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(70),color: Colors.amber),
      child: Image.asset('assets/images/jamtangan.png'),
    );

  }
}