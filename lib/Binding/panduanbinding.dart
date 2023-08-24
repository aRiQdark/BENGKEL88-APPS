import 'package:get/get.dart';
import 'package:jobstreet/controller/controllervideo.dart';

class bindingpanduan implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<controllerpanduan>(() => controllerpanduan());
  }
}