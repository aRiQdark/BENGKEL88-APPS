import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controllerAuth.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logincontroller>(() => Logincontroller());
    Get.lazyPut(() => API());
    Get.put(API());
  }
}
