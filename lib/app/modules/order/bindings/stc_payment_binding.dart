import 'package:get/get.dart';
import 'package:musaneda/app/modules/order/controllers/tabby_stc_controllers/stc_controller.dart';

import '../controllers/tabby_stc_controllers/tabby_controller.dart';



class TabbyPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StcPayPaymentController>(
          () => StcPayPaymentController(),
    );
  }
}