import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpcontroller extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController notelp = TextEditingController();
 
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    alamat.dispose();
    notelp.dispose();
    super.onClose();
  }
}
