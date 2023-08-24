import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class notfound extends StatelessWidget {
  const notfound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              size: 20,color: Colors.black,
            ),),
            centerTitle: true,
            title: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(color: Colors.white,border: Border.all(),borderRadius: BorderRadius.circular(50)),
              child: TextField(),
            ),
      ),
    );
  }
}
