import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/home/nationalities_model.dart';
import 'package:musaneda/components/mySnackbar.dart';
import 'package:musaneda/config/constance.dart';
import 'package:musaneda/config/myColor.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MediationProvider extends GetConnect {
  void sendData(Map data) {
    post('www.google.com', data);
  }

  Future<Nationalities> getNationalities() async {
    try {
      final res = await get(
        "${Constance.apiEndpoint}/musaneda_nationality",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${Constance.instance.token}",
        },
      );

      if (res.body['code'] == 0) {
        mySnackBar(
          title: "error".tr,
          message: "Can't fetch nationalities",
          color: MYColor.warning,
          icon: CupertinoIcons.info_circle,
        );
      }

      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return Nationalities.fromJson(res.body);
      }
    } catch (e, s) {
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }
   Future<int> submitMediation(Map map) async {
    try {
      await EasyLoading.show(status: 'waiting'.tr);
       final res = await post(
        "${Constance.apiEndpoint}/services-mediation",
        map,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${Constance.instance.token}",
        },
      );
        print('=================================================');
        print(res.body);
        if (res.body['code'] == 0) {
        mySnackBar(
          title: "warning".tr,
          message: 'try_again'.tr,
          color: MYColor.warning,
          icon: CupertinoIcons.info_circle,
        );
      }
      if ( res.body['code'] == 1) {
        mySnackBar(
          title: "success".tr,
          message: "msg_mediation_success".tr,
          color: MYColor.success,
          icon: CupertinoIcons.info_circle,
        );
      }

      if (res.status.hasError) {
        return Future.error(res.statusCode!);
      } else {
        return res.body['code'];
      }
    } catch (e, s) {
      print('exception is     ***********            $e');
      await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }
}