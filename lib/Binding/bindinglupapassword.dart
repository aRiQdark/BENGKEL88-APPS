import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controllerresetpassword.dart';



class resetpasswordbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<resetpassword>(() => resetpassword());
    Get.lazyPut(() => API());
    Get.put(API());
  }
}
