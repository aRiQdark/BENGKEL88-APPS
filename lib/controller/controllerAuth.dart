import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Logincontroller extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
 RxBool passwordIsHidden = true.obs;
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
