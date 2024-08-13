import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/packages/packages_model.dart';
import 'package:musaneda/config/constance.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PackagesProvider extends GetConnect {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<PackagesModel> getHourPackages(String lang, int nationalityId) async {
    try {
      await EasyLoading.show(status: 'loading'.tr);
      final res = await get(
          '${Constance.apiEndpoint}/hour-packages/$lang?country_id=$nationalityId',
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${Constance.instance.token}",
          });

      print(res.body);
      print(res.body.runtimeType);
      final response = jsonDecode(res.body);
      if (response['code'] == 0) {
        // Get.snackbar('error'.tr, 'there is an error');
      }
      if (response['code'] == 1) {
        //Get.snackbar('success'.tr, 'Get Packages');
        }

      if (res.status.hasError) {
        return Future.error(res.status.code!);
      } else {
        return PackagesModel.fromJson(response);
      }
    } catch (e, s) {
       await Sentry.captureException(s);
      return Future.error(e);
    }
  }
}
