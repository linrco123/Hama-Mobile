import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/packages/paclages_model.dart';
import 'package:musaneda/app/routes/app_pages.dart';

class PackagesController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getPackages();
  }

  final packages = [
    PackagesModel(
        id: 20,
        name: 'package 1',
        price: '500 SAR',
        workingHours: 4,
        from: '08:00',
        to: '12:00',
        period: 'am'),
    PackagesModel(
        id: 30,
        name: 'package 2',
        workingHours: 8,
        price: '700 SAR',
        from: '12:00',
        to: '7:00',
        period: 'pm'),
    PackagesModel(
        id: 40,
        price: '800 SAR',
        name: 'package 3',
        workingHours: 4,
        from: '10:00',
        to: '2:00',
        period: 'pm'),
    PackagesModel(
        id: 60,
        price: '1000 SAR',
        name: 'package 4',
        workingHours: 6,
        from: '09:00',
        to: '3:00',
        period: 'am')
  ];

  RxInt selectedPackage = 0.obs;

  void getPackages() {}

  void selectPackage(int package) {
    selectedPackage.value = package;
    update();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Get.toNamed(Routes.DATEPICKER);
    });
  }
}
