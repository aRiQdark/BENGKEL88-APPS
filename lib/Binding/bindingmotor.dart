import 'package:get/get.dart';

import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controllerkereta.dart';
import 'package:jobstreet/controller/controllerpembayaran.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';



class bindingmotor implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(()=>Reservasi_view());
 Get.lazyPut(() => controllermotor());
}
}