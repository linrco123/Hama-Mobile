import 'package:get/get.dart';

class PackagesController extends GetxController {


 @override
  void onInit() {
    super.onInit();
   getPackages();
  }
  

  RxInt selectesPackage = 0.obs;
  List<PackagesModel> packages = List.empty(growable: true);

  void getPackages() {}

  void selectPackage(int package) {
    selectesPackage.value = package;
    update();
  }
}

class PackagesModel {}
