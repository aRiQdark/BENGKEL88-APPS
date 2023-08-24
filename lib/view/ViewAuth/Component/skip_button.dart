import 'package:flutter/material.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    // required this.size,
    required this.onTap,
  }) : super(key: key);

  // final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.only(top: 60),
      width: 70,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(onPressed: onTap, child: Text("skip"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),)
    );
  }
}
