import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/Auth/signup/signcont.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllervideo.dart';
import 'package:jobstreet/view/Allpages/Profile.dart';

class signupbinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Authcontroller>(() => Authcontroller());
  //  Get.lazyPut(()=>Profilecustomer());
    Get.put(SignUpcontroller());
    Get.lazyPut(()=>SignUpcontroller());
    Get.lazyPut(() => API());
    Get.put(API());
    Get.lazyPut(() => Homecontroller());
 
  }
}