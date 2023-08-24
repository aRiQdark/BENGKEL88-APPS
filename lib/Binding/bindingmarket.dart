import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controllerfirebasepenjualan.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllerpembayaran.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/checkout-penjualan.dart';

import '../controller/controller.dart';

class bindingMarket implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() =>controllermarket());
    Get.lazyPut(()=>controllerpembayaran());
    Get.lazyPut(() => API());
    Get.put(Homecontroller());
    Get.put(Penjualanfirebasecontroller());
    Get.lazyPut(()=>Checkout());
    Get.put(API());
    
  }
}
