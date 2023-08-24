import 'package:get/get.dart';

import 'package:jobstreet/controller/controller.dart';


class TourGuideBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => controllertour());
  }
}
