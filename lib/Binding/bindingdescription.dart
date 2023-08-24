import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controller.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';
import 'package:jobstreet/view/allpagesadmin/Reservasi.dart';
import 'package:jobstreet/view/description.dart';

class bindingreservasi implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => controllertour());
    // Get.lazyPut(() => API());
    // Get.put(API());
    // Get.put(Reservasi_view());
    // Get.put(Reservasiadmin());

    // Get.lazyPut(() => Reservasiadmin());
    Get.lazyPut(() => Homecontroller());
  }
}
