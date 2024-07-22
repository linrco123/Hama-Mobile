import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/service_type/controllers/servicetype_controller.dart';
import 'package:musaneda/components/hourly/service_type/oneHour_filter_dialog.dart';
import 'package:musaneda/components/hourly/service_type/service_type_card.dart';
import 'package:musaneda/config/exitapp_alert.dart';
import 'package:musaneda/config/myColor.dart';
class ServiceTypeView extends GetView<ServiceTypeController> {
  const ServiceTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<ServiceTypeController>(
              init: controller,
              builder: (controller) {
                // ignore: deprecated_member_use
                return WillPopScope(
                  onWillPop: exitAlertApp,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    height: Get.height,
                    width: Get.width,
                    color: MYColor.primary.withOpacity(0.1),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'choose_service'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MYColor.primary,
                                fontSize: 18.0),
                          ),
                        ), //'choose_appropriate_service'.tr
                  
                        ServiceTypeCard(
                            title: 'hour_service'.tr,
                            description: 'hour_service_desc'.tr,
                            function: () async {
                              await EasyLoading.show(status: 'loading'.tr);
                              myOneHourFilterDialog(context);
                              // Get.defaultDialog();
                            }),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ServiceTypeCard(
                            title: 'stayin_service'.tr,
                            description: 'stayin_service_desc'.tr,
                            function: () async {
                              await EasyLoading.show(status: 'loading'.tr);
                              controller.goToHomePage();
                            })
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
