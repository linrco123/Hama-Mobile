// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/controllers/language_controller.dart';
import 'package:musaneda/components/myCupertinoButton.dart';
import 'package:musaneda/config/myColor.dart';

import '../app/modules/home/controllers/home_controller.dart';
import 'myDropdown.dart';
import 'mySnackbar.dart';

void myFilterDialog(context) => Get.defaultDialog(
      backgroundColor: MYColor.white,
      title: "filter_menu_due_to".tr,
      titleStyle: TextStyle(
        color: MYColor.buttons,
        fontSize: 16,
        fontFamily: 'cairo_medium',
      ),
      radius: 8,
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.all(20),
      content: SizedBox(
        // height: 343,
        width: double.infinity,
        child: GetBuilder(
          init: HomeController.I,
          builder: (ctx) {
            final homeController = HomeController.I;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'nationality'.tr,
                    style: TextStyle(
                      color: MYColor.texts,
                      fontSize: 14,
                      fontFamily: 'cairo_regular',
                    ),
                  ),
                ),
                myDropdown(
                  context: context,
                  value: HomeController.I.nationality.value,
                  onChanged: (value) {
                    HomeController.I.setNationality = value;
                  },
                  items: HomeController.I.nationalityList.map((item) {
                    return DropdownMenuItem(
                      value: item.id,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          LanguageController.I.isEnglish
                              ? item.name!.en!
                              : item.name!.ar!,
                          style: TextStyle(
                            color: MYColor.greyDeep,
                            fontSize: 12,
                            fontFamily: 'cairo_regular',
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'age'.tr,
                    style: TextStyle(
                      color: MYColor.texts,
                      fontSize: 14,
                      fontFamily: 'cairo_regular',
                    ),
                  ),
                ),
                Obx(() => myDropdown(
                      context: context,
                      value: homeController.a.value,
                      onChanged: (value) {
                        homeController.setAge = value;
                      },
                      items: homeController.ages.map((item) {
                        return DropdownMenuItem(
                          value: item.id,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              LanguageController.I.isEnglish
                                  ? item.name.en!
                                  : item.name.ar!,
                              style: TextStyle(
                                color: MYColor.greyDeep,
                                fontSize: 12,
                                fontFamily: 'cairo_regular',
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'marital_status'.tr,
                    style: TextStyle(
                      color: MYColor.texts,
                      fontSize: 14,
                      fontFamily: 'cairo_regular',
                    ),
                  ),
                ),
                Obx(
                  () => myDropdown(
                    context: context,
                    value: homeController.maritalStatus.value,
                    onChanged: (value) {
                      homeController.setMarital = value;
                    },
                    items: homeController.maritalList.map((item) {
                      return DropdownMenuItem(
                        value: item.id,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            LanguageController.I.isEnglish
                                ? item.name.en!
                                : item.name.ar!,
                            style: TextStyle(
                              color: MYColor.greyDeep,
                              fontSize: 12,
                              fontFamily: 'cairo_regular',
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
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
            if (HomeController.I.a.value == 0 &&
                HomeController.I.nationality.value == 0 &&
                HomeController.I.maritalStatus.value == 0) {
              mySnackBar(
                title: "warning".tr,
                message: "choose_atleast_one".tr,
                color: MYColor.warning,
                icon: CupertinoIcons.info_circle,
              );
            } else {
              Get.back();
              if (HomeController.I.tap.value != 0) {
                HomeController.I.backTap();
              }
              HomeController.I.getFilter();
            }
          },
          text: "search".tr,
        ),
      ),
      confirmTextColor: MYColor.primary,
      onWillPop: () {
        Get.back();
        if (HomeController.I.tap.value != 0) {
          HomeController.I.backTap();
        }
        return Future.value(true);
      },
    );
