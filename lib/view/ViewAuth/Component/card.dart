import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cardbrg extends StatelessWidget {
  const Cardbrg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
     
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('30%'),
                  ),
                ),
                const Icon(Icons.lock_outline_rounded)
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              offset: Offset(
                1.0,
                2.0,
              ),
              blurRadius: 4.0,
              spreadRadius: 0.1,
            )
          ]),
    );
    ;
  }
}
