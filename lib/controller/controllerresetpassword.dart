import 'package:flutter/material.dart';
import 'package:get/get.dart';

class resetpassword extends GetxController{
   TextEditingController emailC = TextEditingController();
  
 RxBool passwordIsHidden = true.obs;
  void onClose() {
    emailC.dispose();
   
    super.onClose();
  }
}