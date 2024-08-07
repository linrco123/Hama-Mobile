import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/home/cities_model.dart';
import 'package:musaneda/app/modules/hourly_service/service_type/models/hourly_order_model.dart';
import 'package:musaneda/components/mySnackbar.dart';
import 'package:musaneda/config/constance.dart';
import 'package:musaneda/config/myColor.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:http/http.dart' as http;

class ServiceTypeProvider extends GetConnect {
  Future<Cities> getCities() async {
    try {
      final res = await get(
        "${Constance.apiEndpoint}/cities",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${Constance.instance.token}",
        },
      );

      if (res.body['code'] == 0) {
        mySnackBar(
          title: "error".tr,
          message: "Can't fetch cities",
          color: MYColor.warning,
          icon: CupertinoIcons.info_circle,
        );
      }

      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return Cities.fromJson(res.body);
      }
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }

  Future<HourlyOrderModel> submitHourOrder(Map<String, dynamic> map) async {
    try {
      await EasyLoading.show(status: 'waiting'.tr);
      final res = await http.post(
        Uri.parse("${Constance.apiEndpoint}/create/hour/order"),
        body: map,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${Constance.instance.token}",
        },
      );
      if (jsonDecode(res.body)['code'] == 0) {
        mySnackBar(
          title: "warning".tr,
          message: 'try_again'.tr,
          color: MYColor.warning,
          icon: CupertinoIcons.info_circle,
        );
      }
      if(jsonDecode(res.body)['code'] == 1){
         mySnackBar(
          title: "success".tr,
          message: "msg_order_success".tr,
          color: MYColor.success,
          icon: CupertinoIcons.info_circle,
        );
      }

      if (res.statusCode != 200) {
        return Future.error(res.statusCode);
      } else {
        return HourlyOrderModel.fromJson(jsonDecode(res.body));
      }
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }
}
