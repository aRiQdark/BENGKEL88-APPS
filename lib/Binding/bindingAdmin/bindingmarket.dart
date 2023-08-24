

import 'package:get/get.dart';
import 'package:jobstreet/controller/controllerhome.dart';

import '../../controller/controlleradmin/controllerpenjualan.dart';

class marketbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<controllermarketAdmin>(() => controllermarketAdmin());
   Get.lazyPut(() => Homecontroller());
  }
}
