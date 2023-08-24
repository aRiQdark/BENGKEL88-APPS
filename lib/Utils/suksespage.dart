import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class suksespage extends StatelessWidget {
  const suksespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child:Column(
            children: [
              SizedBox(height: 50,),
              Lottie.asset('assets/lottie/tick.json'),
            SizedBox(height: 30,),
            Text("Pembayaran terkirim",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
        ),
      )
    );
  }
}