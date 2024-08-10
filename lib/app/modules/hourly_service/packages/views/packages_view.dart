import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/packages/controllers/packages_controller.dart';
import 'package:musaneda/components/hourly/packages/package_card.dart';
import 'package:musaneda/components/hourly/return_back_btn.dart';
import 'package:musaneda/config/myColor.dart';

class PackagesView extends GetView<PackagesController> {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
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
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SvgPicture.asset(
                    "assets/images/icon/no_result.svg",
                    height: 134.36,
                    width: 100,
                    color: MYColor.primary,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "the_packages_is_empty".tr,
                    style: TextStyle(color: MYColor.grey, fontSize: 18.0),
                  ),
                ])
              : ListView.separated(
                  itemCount: controller.packages.length,
                  itemBuilder: (context, index) {
                    return Obx(
                     ()=> MyPackageCard(
                        package: controller.packages[index],
                        isActive: controller.selectedPackage.value ==
                            controller.packages[index].id,
                        onTap: () {
                          controller.selectPackage(controller.packages[index].id);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15.0,
                  ),
                ),
        ),
      ),
    );
  }
}
