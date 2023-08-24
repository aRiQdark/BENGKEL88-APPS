import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartBtn extends StatelessWidget {
  const StartBtn({
    Key? key,
    // required this.size,
    required this.onTap,
  }) : super(key: key);

  // final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                                    onPressed: () => Get.toNamed('/Log-in'),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.green,
                                    ),
                                    child: Icon(Icons.arrow_forward_outlined),
                                  );
                                
  }
}
