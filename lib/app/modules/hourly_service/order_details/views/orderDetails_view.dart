import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/controllers/language_controller.dart';
import 'package:musaneda/app/modules/hourly_service/date_picker/controllers/date_picker_controller.dart';
import 'package:musaneda/app/modules/hourly_service/order_details/controllers/orderdetails_controller.dart';
import 'package:musaneda/app/modules/hourly_service/packages/controllers/packages_controller.dart';
import 'package:musaneda/app/modules/hourly_service/service_type/controllers/servicetype_controller.dart';
import 'package:musaneda/app/modules/locations/controllers/locations_controller.dart';
import 'package:musaneda/components/hourly/packages/package_card.dart';
import 'package:musaneda/components/hourly/return_back_btn.dart';
import 'package:musaneda/components/myCupertinoButton.dart';
import 'package:musaneda/components/myInkWell.dart';
import 'package:musaneda/config/myColor.dart';

class OrderDetailsView extends GetView<OrderdetailsController> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var packageController = Get.find<PackagesController>();
    var datePickerController = Get.find<DatePickerController>();
    var serviceTypeController = Get.find<ServiceTypeController>();
    var locationController = Get.find<LocationsController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MYColor.primary.withOpacity(0.1),
        title: Text(
          "order_details".tr,
          style: TextStyle(color: MYColor.primary),
        ),
        leading: ReturnButton(color: MYColor.primary, size: 20.0),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: Get.height,
        width: Get.width,
        color: MYColor.primary.withOpacity(0.1),
        child: GetBuilder(
          init: controller,
          builder: (controller) => Column(
            children: [
              MyPackageCard(
                  package: packageController.packages.firstWhere((package) =>
                      package.id == packageController.selectedPackage.value),
                  isActive: false),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                //height: 80.0,
                width: Get.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: MYColor.primary.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(1, 1))
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                    color: MYColor.white),
                child: Column(
                  children: [
                    Text(
                      'date'.tr,
                      style: TextStyle(
                          color: MYColor.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      datePickerController.selectedDate.value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'address'.tr,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: MYColor.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        locationController.hourLocations.value
                            .firstWhere((location) =>
                                location.id ==
                                serviceTypeController.selectedLocation.value)
                            .address!,
                        style: const TextStyle(
                            // color: MYColor.primary,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                //height: 80.0,
                width: Get.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: MYColor.primary.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(1, 1))
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                    color: MYColor.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'nationality'.tr,
                          style: TextStyle(
                              color: MYColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          LanguageController.I.isEnglish
                              ? serviceTypeController.nationalityList
                                  .firstWhere((nationality) =>
                                      nationality.id ==
                                      serviceTypeController.nationality.value)
                                  .name!
                                  .en!
                              : serviceTypeController.nationalityList
                                  .firstWhere((nationality) =>
                                      nationality.id ==
                                      serviceTypeController.nationality.value)
                                  .name!
                                  .ar!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'visits_number'.tr,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: MYColor.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            LanguageController.I.isEnglish
                                ? serviceTypeController.visitNumberList
                                    .firstWhere((visit) =>
                                        visit.id ==
                                        serviceTypeController
                                            .visitsNumber.value)
                                    .name!
                                    .en!
                                : serviceTypeController.visitNumberList
                                    .firstWhere((visit) =>
                                        visit.id ==
                                        serviceTypeController
                                            .visitsNumber.value)
                                    .name!
                                    .ar!,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('maids_number'.tr,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: MYColor.primary,
                                fontWeight: FontWeight.bold)),
                        Text(serviceTypeController.maidsNumber.value.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: MyCupertinoButton(
                    fun: () {},
                    text: 'استكمال الطلب والدفع اونلاين',
                    btnColor: MYColor.buttons,
                    txtColor: MYColor.btnTxtColor),
              ),
              const SizedBox(height:5.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: MyCupertinoButton(
                    fun: () {},
                    text: ' استكمال الطلب والدفع عبر مدى عند الاستلام',
                    btnColor: MYColor.buttons,
                    txtColor: MYColor.btnTxtColor),
              ),
              const SizedBox(height:5.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: MyCupertinoButton(
                    fun: () {
                      serviceTypeController.submitHourlyOrder(
                          datePickerController.selectedDate.value,
                          packageController.selectedPackage.value);
                    },
                    text: ' استكمال الطلب والدفع عبر طريق حوالة بنكية',
                    btnColor: MYColor.buttons,
                    txtColor: MYColor.btnTxtColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
