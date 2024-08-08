import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/packages_view/controllers/packages_controller.dart';
import 'package:musaneda/app/routes/app_pages.dart';
import 'package:musaneda/components/hourly/return_back_btn.dart';
import 'package:musaneda/components/myCupertinoButton.dart';
import 'package:musaneda/config/myColor.dart';

class PackagesView extends GetView<PackagesController> {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MYColor.primary.withOpacity(0.1),
        title: Text('choose_package'.tr,
            style: TextStyle(color: MYColor.primary, fontSize: 18.0)),
        leading: ReturnButton(color: MYColor.primary, size: 20.0),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: MYColor.primary.withOpacity(0.1),
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<PackagesController>(
          init: controller,
          builder: (controller) => controller.packages.isEmpty
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "the_packages_is_empty".tr,
                    style: TextStyle(color: MYColor.grey, fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0,),
                  SizedBox(
                    width: 100.0,
                    height: 52,
                    child: MyCupertinoButton(
                      btnColor: MYColor.buttons,
                      txtColor: MYColor.white,
                      fun: () {
                        Get.toNamed(Routes.DATEPICKER);
                      },
                      text: "proceed".tr,
                    ),
                  ),
                ])
              : ListView.builder(
                  itemCount: 10, //controller.packages.length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      controller.selectPackage(2);
                    },
                    child: Card(
                      child: Container(
                        color: controller.selectesPackage.value == 2
                            ? MYColor.primary
                            : MYColor.white,
                        height: 100.0,
                        width: Get.width,
                        child: Text('Contract   # ${index + 1}',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: controller.selectesPackage.value == 2
                                    ? MYColor.white
                                    : MYColor.primary)),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
