

import 'package:get/get.dart';
import 'package:jobstreet/controller/controlleradmin/controllerpemesananbrg.dart';
import 'package:jobstreet/controller/controllerhome.dart';

class pemesananbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<pemesanancontroller>(() => pemesanancontroller());
   Get.put(Homecontroller());
  }
}
