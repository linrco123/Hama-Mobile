import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/home/cities_model.dart';
import 'package:musaneda/app/modules/home/name_language_model.dart';
import 'package:musaneda/app/modules/home/nationalities_model.dart';
import 'package:musaneda/app/modules/hourly_service/service_type/providers/servicetype_provider.dart';
import 'package:musaneda/app/modules/order/views/bank_account/bank_accounts_details_view.dart';
import 'package:musaneda/app/routes/app_pages.dart';
import 'package:musaneda/components/mySnackbar.dart';
import 'package:musaneda/config/myColor.dart';

class ServiceTypeController extends GetxController {
  static ServiceTypeController get I => Get.put(ServiceTypeController());
  @override
  void onInit() {
    super.onInit();
    getCities();
    getNationalities();
    workersNumbercontroller = TextEditingController()..text = '1';
  }

  void increaseMaidssNumber() {
    maidsNumber.value++;
    workersNumbercontroller.text = maidsNumber.value.toString();
    update();
  }

  void decreaseMaidssNumber() {
    if (maidsNumber.value > 1) {
      maidsNumber.value--;
    }
    workersNumbercontroller.text = maidsNumber.value.toString();
    update();
  }
  void pickAddress(int addressId) {
    selectedLocation.value = addressId;
    update();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      print('===========================rdffffffffffff========================d');
      Get.toNamed(Routes.ORDERDETAILS);
    });
  }

  //void Function(String)? onChanged
  void onChanged(String number) {
    if (number.isEmpty) {
      maidsNumber.value = 1;
      workersNumbercontroller.text = maidsNumber.value.toString();
    } else {
      if (number.startsWith('1')) {
        String num = number.split('1')[1];

        workersNumbercontroller.text = '';
        workersNumbercontroller.text = num;
        maidsNumber.value = int.parse(num);
      } else {
        workersNumbercontroller.text = '';
        workersNumbercontroller.text = number;
        maidsNumber.value = int.parse(number);
      }
    }
  }

  late TextEditingController workersNumbercontroller;
  RxInt nationality = 0.obs;
  RxInt city = 0.obs;
  RxInt workingHours = 4.obs;
  //shiftType1 = 'am'  ------ shiftType1 = 'pm'
  RxString shiftType = 'am'.obs;
  RxInt visitsNumber = 0.obs;
  RxInt maidsNumber = 1.obs;
  final selectedLocation = 0.obs;

  void submitHourlyOrder(String date, int packageId) {
    Map<String, dynamic> map = {
      'country_id': nationality.value.toString(),
      'shift': shiftType.value.toString(),
      'from_date': date.toString(),
      //'package_id': packageId,
      //'to_date': date,
      'from_time': getShiftStartingTime.toString(),
      'duration': workingHours.value.toString(),
      'user_address_id': selectedLocation.value.toString(),
      'servant_count': maidsNumber.value.toString(),
      'visits': visitsNumber.value.toString(),
      //'cost':1000
    };

    ServiceTypeProvider().submitHourOrder(map).then((value) {
      EasyLoading.dismiss();
      String orderID = value.data!.order!.id!.toString();
      double totalPrice = double.parse(value.data!.order!.cost!.toString());
      Get.to(() => const BankAccountdetails(), arguments: {
        'orderID': orderID,
        'totalPrice': totalPrice,
        'page': 'hour'
      });
    }).catchError((error) {
      EasyLoading.dismiss();
      print('=================== Error =============');
    });
  }

  String get getShiftStartingTime =>
      shiftType.value == 'am' ? '08:00' : '12:00';

  printDataMembers() {
    print('============ ServiceType Data Members =======================');
    print('nationality ==============> ${nationality.value}');
    print('workingHours ==============> ${workingHours.value}');
    print('shiftType ==============> ${shiftType.value}');
    print('visitsNumber ==============> ${visitsNumber.value}');
    print('maidsNumber ==============> ${maidsNumber.value}');
    print('selectedLocation ==============> ${selectedLocation.value}');
  }

  set changeWorkingHours(int wHours) {
    workingHours.value = wHours;
    if (wHours == 8) {
      shiftType.value = 'am';
    }
    update();
  }

  void changeShiftType(String shift) {
    shiftType.value = shift;
    update();
  }

  goToHomePage() {
    Get.toNamed(Routes.HOME);
  }

  void validateFilterOptions() {
    if (nationality.value == 0) {
      mySnackBar(
        title: "warning".tr,
        message: "choose_nationality".tr,
        color: MYColor.warning,
        icon: CupertinoIcons.info_circle,
      );
    } else if (visitsNumber.value == 0) {
      mySnackBar(
        title: "warning".tr,
        message: "choose_visit_number".tr,
        color: MYColor.warning,
        icon: CupertinoIcons.info_circle,
      );
    } else if (maidsNumber.value == 0) {
      mySnackBar(
        title: "warning".tr,
        message: "choose_maid_number".tr,
        color: MYColor.warning,
        icon: CupertinoIcons.info_circle,
      );
    } else {
      Get.back();
      //Get.toNamed(Routes.SHOWADDRESS);
      Get.toNamed(Routes.PACKAGES);
    }
  }

  //nationalities section
  List<NationalitiesData> nationalityList =
      List<NationalitiesData>.empty(growable: true).obs;

  Future<void> getNationalities() async {
    nationalityList.add(
      NationalitiesData(
        id: 0,
        name: NameLanguage(
          ar: "اختر الجنسيه",
          en: "Select Nationality",
        ),
      ),
    );

    isLoading(true);
    ServiceTypeProvider().getNationalities().then((value) {
      for (var data in value.data as List) {
        nationalityList.add(data);
      }
      isLoading(false);
    });

    update();
  }

  set setNationality(setBranch) {
    nationality.value = setBranch;
    update();
  }
  //cities

  var listCities = List<CitiesData>.empty(growable: true).obs;
  RxBool isLoading = false.obs;
  Future<void> getCities() async {
    listCities.add(
      CitiesData(
        id: 0,
        name: NameLanguage(
          ar: "اختر المدينه",
          en: "Select City",
        ),
      ),
    );
    isLoading(true);
    ServiceTypeProvider().getCities().then((value) {
      for (var data in value.data as List) {
        listCities.add(data);
      }
      isLoading(false);
    });

    update();
  }

  set setCity(setCity) {
    city.value = setCity;
    update();
  }

  set setVisitsNumber(int i) {
    visitsNumber.value = i;
    update();
  }

  List<NationalitiesData> visitNumberList = [
    NationalitiesData(
      id: 0,
      name: NameLanguage(
        ar: "اختر عدد الزيارات",
        en: "Select visit numbers",
      ),
    ),
    NationalitiesData(
      id: 1,
      name: NameLanguage(
        ar: "عقد شهرى",
        en: "Monthly Contracts",
      ),
    ),
    NationalitiesData(
      id: 2,
      name: NameLanguage(
        ar: "زيارة واحدة",
        en: "Single Visit",
      ),
    ),
    NationalitiesData(
      id: 3,
      name: NameLanguage(
        ar: "6 أيام فى الإسبوع",
        en: "6 Days Per Week",
      ),
    ),
  ];
}
