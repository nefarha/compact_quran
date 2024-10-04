import 'package:get/get.dart';

import '../controllers/flash_read_controller.dart';

class FlashReadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlashReadController>(
      () => FlashReadController(),
    );
  }
}
