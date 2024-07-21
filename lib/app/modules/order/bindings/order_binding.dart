import 'package:get/get.dart';
import 'package:musaneda/app/modules/order/controllers/tabby_stc_controllers/tabby_controller.dart';

import '../controllers/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
      () => OrderController(),
    );

  }
}
