// ignore_for_file: file_names

 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/controllers/language_controller.dart';
import 'package:musaneda/app/modules/hourly_service/service_type/controllers/servicetype_controller.dart';
 import 'package:musaneda/components/hourly/service_type/disabled_shifttype_widget.dart';
import 'package:musaneda/components/hourly/service_type/maids_counter_btn.dart';
import 'package:musaneda/components/hourly/service_type/shift_type_btn.dart';
import 'package:musaneda/components/hourly/service_type/working_hours_btn.dart';
import 'package:musaneda/components/myCupertinoButton.dart';
import 'package:musaneda/components/myDropdown.dart';
 import 'package:musaneda/config/myColor.dart';

void myOneHourFilterDialog(context) => Get.defaultDialog(
      backgroundColor: MYColor.white,
      title: "filter_menu_due_to".tr,
      titleStyle: TextStyle(
        color: MYColor.primary,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        fontFamily: 'cairo_medium',
      ),
      radius: 20,
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.all(20),
      content: SizedBox(
        height: 288,
        width: double.infinity,
        child: GetBuilder<ServiceTypeController>(
          init: Get.put(ServiceTypeController()),
          builder: (ctx)   {
              EasyLoading.dismiss();
            final serviceTypeController = Get.find<ServiceTypeController>();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/nations.png',
                          height: 25.0,
                          width: 25,
                          color: MYColor.icons,
                          filterQuality: FilterQuality.high,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'nationality'.tr,
                          style: TextStyle(
                            color: MYColor.primary,
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'cairo_regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => myDropdown(
                      context: context,
                      value: serviceTypeController.nationality.value,
                      onChanged: (value) {
                        serviceTypeController.setNationality = value;
                      },
                      items: serviceTypeController.nationalityList.map((item) {
                        return DropdownMenuItem(
                          value: item.id,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Text(
                              LanguageController.I.isEnglish
                                  ? item.name!.en!
                                  : item.name!.ar!,
                              style: TextStyle(
                                color: MYColor.greyDeep,
                                fontSize: 13,
                                fontFamily: 'cairo_regular',
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.confirmation_number_outlined,
                          color: MYColor.icons,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'visits_number'.tr,
                          style: TextStyle(
                            color: MYColor.primary,
                            fontSize: 15,
                           // fontWeight: FontWeight.bold,
                            fontFamily: 'cairo_regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => myDropdown(
                      context: context,
                      value: serviceTypeController.visitsNumber.value,
                      onChanged: (value) {
                        serviceTypeController.setVisitsNumber = value;
                      },
                      items: serviceTypeController.visitNumberList.map((item) {
                        return DropdownMenuItem(
                          value: item.id,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Text(
                              LanguageController.I.isEnglish
                                  ? item.name!.en!
                                  : item.name!.ar!,
                              style: TextStyle(
                                color: MYColor.greyDeep,
                                fontSize: 13,
                                fontFamily: 'cairo_regular',
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: MYColor.icons,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'working_hours'.tr,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: MYColor.primary,
                             // fontWeight: FontWeight.bold
                              ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        WorkingHoursButton(
                            title: '4',
                            isActive:
                                serviceTypeController.workingHours.value == 4,
                            onTap: () {
                              serviceTypeController.changeWorkingHours = 4;
                            }),
                        const SizedBox(
                          width: 10.0,
                        ),
                        WorkingHoursButton(
                            title: '8',
                            isActive:
                                serviceTypeController.workingHours.value == 8,
                            onTap: () {
                              serviceTypeController.changeWorkingHours = 8;
                            }),
                      ],
                    ),
                  ),

                  //Shift type
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: MYColor.icons,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'shift_type'.tr,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: MYColor.primary,
                              //fontWeight: FontWeight.bold
                              ),
                        ),
                      ],
                    ),
                  ),
                  serviceTypeController.workingHours.value == 8
                      ? const DisabledShiftTypeWidget()
                      : Obx(
                          () => Row(
                            children: [
                              ShiftTypeButton(
                                  title: 'Morning'.tr,
                                  isActive:
                                      serviceTypeController.shiftType.value ==
                                          'am',
                                  onTap: () {
                                    serviceTypeController.changeShiftType('am');
                                  }),
                              const SizedBox(
                                width: 10.0,
                              ),
                              ShiftTypeButton(
                                  title: 'evening'.tr,
                                  isActive:
                                      serviceTypeController.shiftType.value ==
                                          'pm',
                                  onTap: () {
                                    serviceTypeController.changeShiftType('pm');
                                  }),
                            ],
                          ),
                        ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.numbers_outlined,
                          color: MYColor.icons,
                          //size: ,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'maids_number'.tr,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: MYColor.primary,
                            //  fontWeight: FontWeight.bold
                              ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      MaidsCounterButton(
                          text: '+',
                          onTap: () {
                            serviceTypeController.increaseMaidssNumber();
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          height: 40.0,
                          width: 42.0,
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 17.0,
                              color: MYColor.greyDeep,
                            ),
                            controller:
                                serviceTypeController.workersNumbercontroller,
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                serviceTypeController.onChanged(value),
                            // onFieldSubmitted: (value) =>
                            //     serviceTypeController.onChanged(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 13.0,right: 13.0, bottom: 7.0),
                                filled: true,
                                fillColor: MYColor.grey.withOpacity(0.1)),
                          ),
                        ),
                      ),
                      MaidsCounterButton(
                          text: '-',
                          onTap: () {
                            serviceTypeController.decreaseMaidssNumber();
                          }),
                    ],
                  ),

                  //visits number
                ],
              ),
            );
          },
        ),
      ),
      confirm: SizedBox(
        width: double.infinity,
        height: 52,
        child: MyCupertinoButton(
          btnColor: MYColor.buttons,
          txtColor: MYColor.white,
          fun: () {
            ServiceTypeController.I.validateFilterOptions();
            
          },
          text: "proceed".tr,
        ),
      ),
      confirmTextColor: MYColor.btnTxtColor,
      onWillPop: () {
        Get.back();
        return Future.value(true);
      },
    );
