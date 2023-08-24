import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';

import '../controller/controllerOnboarding.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut(() => API());
    Get.put(API());
  }
}
