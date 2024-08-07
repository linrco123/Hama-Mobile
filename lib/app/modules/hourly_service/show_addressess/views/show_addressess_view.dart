import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/service_type/controllers/servicetype_controller.dart';
import 'package:musaneda/app/modules/locations/controllers/locations_controller.dart';
import 'package:musaneda/app/modules/locations/views/create_location_view.dart';
import 'package:musaneda/app/routes/app_pages.dart';
import 'package:musaneda/components/myCupertinoButton.dart';
import 'package:musaneda/components/mySnackbar.dart';
import 'package:musaneda/config/myColor.dart';

class ShowAddressessView extends GetView<LocationsController> {
  const ShowAddressessView({super.key});

  @override
  Widget build(BuildContext context) {
    var locationController = Get.put(LocationsController());

    if (Get.previousRoute == Routes.CREATELOCATIONS) {
      locationController.update();
    }
    var serviceTypeController = Get.find<ServiceTypeController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'add_address'.tr,
          style: TextStyle(
              fontSize: 18.0,
              color: MYColor.primary,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: MYColor.primary.withOpacity(0.1),
        foregroundColor: MYColor.primary.withOpacity(0.1),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: MYColor.primary,
          ),
        ),
      ),
      body: Container(
        color: MYColor.primary.withOpacity(0.1),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const CreateLocationView(
                    action: 'create',
                    page: 'hour',
                  ),
                );
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: SizedBox(
                  height: 60.0,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Pick_new_location_map'.tr,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: MYColor.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.grey.shade400,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(children: [
                Expanded(child: Divider(color: MYColor.primary,thickness: 1.0,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('OR' , style: TextStyle(fontSize: 15.0 , color: MYColor.primary),),
                ),
                Expanded(child: Divider(color: MYColor.primary,thickness: 1.0,)),
              ],),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0,top: 0.0),
              child: Row(
                children: [
                  Image.asset(
                    height: 30.0,
                    width: 30.0,
                    'assets/images/location.png',
                    color: MYColor.buttons,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'choose_address'.tr,
                    style: TextStyle(color: MYColor.primary, fontSize: 18.0),
                  ),
                ],
              ),
            ),
            GetBuilder<LocationsController>(builder: (_) {
              return Expanded(
                child: locationController.listLocations.isEmpty
                    ? Center(
                        child: Text(
                        'no_addressess'.tr,
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.grey.shade400),
                      ))
                    : ListView.separated(
                        itemCount: locationController.listLocations.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              serviceTypeController.pickAddress(
                                  locationController.listLocations[index].id!);
                            },
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.all(15.0),
                                //height: 80.0,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: serviceTypeController
                                                .selectedLocation.value ==
                                            locationController
                                                .listLocations[index].id
                                        ? MYColor.primary
                                        : MYColor.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      locationController
                                          .listLocations[index].title!,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: serviceTypeController
                                                      .selectedLocation.value ==
                                                  locationController
                                                      .listLocations[index].id
                                              ? MYColor.white
                                              : MYColor.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            locationController
                                                .listLocations[index].address!,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: serviceTypeController
                                                          .selectedLocation
                                                          .value ==
                                                      locationController
                                                          .listLocations[index]
                                                          .id
                                                  ? MYColor.white
                                                  : MYColor.primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10.0,
                        ),
                      ),
              );
            }),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 50.0,
              width: Get.width,
              child: MyCupertinoButton(
                  fun: () {
                    if (serviceTypeController.selectedLocation.value != 0) {
                      Get.toNamed(Routes.DATEPICKER);
                    } else {
                      mySnackBar(
                        title: "warning".tr,
                        message: 'choose_addressess'.tr,
                        color: MYColor.warning,
                        icon: CupertinoIcons.info_circle,
                      );
                    }
                  },
                  text: 'choose_location'.tr,
                  btnColor: MYColor.buttons,
                  txtColor: MYColor.btnTxtColor),
            )
          ],
        ),
      ),
    );
  }
}
