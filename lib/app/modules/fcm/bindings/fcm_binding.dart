import 'package:get/get.dart';

import '../controllers/fcm_controller.dart';

class FcmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FcmController>(
      () => FcmController(),
    );
  }
}
