

import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/packages_view/controllers/packages_controller.dart';
 
class PackagesBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PackagesController>(()=>PackagesController());
  }
  
}