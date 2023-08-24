import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class barangsepatu extends StatelessWidget {
  const barangsepatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(
        left: 10
      ),
      height: 70,
      width: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(70), color: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
      child: Image.asset('assets/images/png-clipart-slip-on-shoe-slipper-leather-sepatu-kerja-sepatu-brown-leather-removebg-preview.png'),
    );
  }
}