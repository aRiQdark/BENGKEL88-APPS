import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:jobstreet/controller/controlleradmin/controllerfirebasepenjualan.dart';

import 'package:jobstreet/view/Allpages/Profile.dart';



class firebasebindingstok implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() =>firebasetest());
    
  }
}
