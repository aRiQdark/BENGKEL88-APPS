import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerresetpassword.dart';
import 'package:lottie/lottie.dart';

class Gantipass extends GetView<resetpassword> {
  Gantipass({super.key});
  final authC = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
              
                         SizedBox(
                  height: 20,
                ),
                Text(
                  'Ganti Password',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 60,
                ),
                 Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              height: 60,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                       controller: controller.emailC,
                      decoration: InputDecoration(
                       
                        hintText: 'Masukkan E-mail anda'
                      ),
                    ),
                  )
                ),
              ),
            ),
            SizedBox(
                  height: 60,
                ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10),
                //   height: 70,
                //   width: 227,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(18),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: TextField(
                //       controller: controller.emailC,
                //       decoration: const InputDecoration(
                //         hintText: 'Masukkan email anda',
                //       ),
                //     ),
                //   ),
                // ),
                ElevatedButton(
                    onPressed: () => authC.resetpassword(controller.emailC.text), child: const Text('Lanjut'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
