import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controllerhome.dart';

import 'package:jobstreet/view/Allpages/Profile.dart';



class profilebinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() =>Profilecustomer());
    Get.lazyPut(()=>Profilecustomer());
    Get.lazyPut(()=>Homecontroller());
    Get.put(API());
  }
}
