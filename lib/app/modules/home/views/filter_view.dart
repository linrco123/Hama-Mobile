import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:musaneda/app/controllers/language_controller.dart';
import 'package:musaneda/components/hourly/return_back_btn.dart';
import 'package:musaneda/components/myFilterDialog.dart';

import '../../../../components/myCupertinoButton.dart';
import '../../../../components/myMusaneda.dart';
import '../../../../config/myColor.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class FilterView extends GetView<HomeController> {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MYColor.primary,
        title: Text('add_order'.tr),
        centerTitle: true,
        leading: ReturnButton(color: MYColor.white, size: 20.0),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 40,
                width: Get.width,
                decoration: BoxDecoration(
                  color: MYColor.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "services".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'cairo_medium',
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        HomeController.I.setPrev();
                        HomeController.I.setTap = 1;
                        myFilterDialog(context);
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "assets/images/icon/filtter.svg",
                          fit: BoxFit.fill,
                          color: MYColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: HomeController.I.isLoading.value,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: Center(
                    child: LinearProgressIndicator(
                      minHeight: 1,
                      backgroundColor: MYColor.success,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        MYColor.warning,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Obx(
              () {
                if (controller.listFilter.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/icon/no_result.svg",
                          height: 134.36,
                          width: 100,
                          color: MYColor.primary,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "there_are_no_results".tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: MYColor.grey,
                            fontFamily: 'cairo_regular',
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          width: 166,
                          child: MyCupertinoButton(
                            fun: () {
                              controller.searchController.clear();
                              controller.getSearch("");

                              controller.setTap = 2;
                              Get.back();
                            },
                            text: "see_musaneda".tr,
                            btnColor: MYColor.buttons,
                            txtColor: MYColor.btnTxtColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return LazyLoadScrollView(
                  onEndOfPage: () {
                    HomeController.I.getMoreFilter();
                  },
                  isLoading: HomeController.I.lastPage.value,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.listFilter.length,
                    itemBuilder: (context, i) {
                      final musaneda = controller.listFilter[i];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.MUSANEDA,
                              arguments: musaneda,
                            );
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: myMusanedaCard(
                            context: context,
                            name: LanguageController.I.getLocale == 'ar'
                                ? musaneda.name?.ar
                                : musaneda.name?.en,
                            image: musaneda.image,
                            country: LanguageController.I.getLocale == 'ar'
                                ? musaneda.nationality?.name?.ar
                                : musaneda.nationality?.name?.en,
                            age: "${musaneda.age} ${"year".tr}",
                            about: LanguageController.I.getLocale == 'ar'
                                ? musaneda.description?.ar
                                : musaneda.description?.en,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
