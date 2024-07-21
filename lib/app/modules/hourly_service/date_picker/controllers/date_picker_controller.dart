import 'package:get/get.dart';

class DatePickerController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  late DateTime dateTime;
  RxString selectedDate = ''.obs;

  void selectDateTime(DateTime dateTime) {
    selectedDate?.value = dateTime.toString().split(' ')[0];
    update();
  }
}
