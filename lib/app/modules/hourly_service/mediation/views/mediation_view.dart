import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:musaneda/app/modules/hourly_service/mediation/controllers/mediation_controller.dart';
import 'package:musaneda/config/myColor.dart';

class MediationView extends GetView<MediationController> {
  const MediationView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediationController = Get.find<MediationController>();
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: MYColor.primary.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Obx(
          //   () => Visibility(
          //     visible: mediationController.isLoading.value,
          //     maintainAnimation: true,
          //     maintainState: true,
          //     maintainSize: true,
          //     child: Center(
          //       child: LinearProgressIndicator(
          //         minHeight: 2,
          //         backgroundColor: MYColor.primary,
          //         valueColor: AlwaysStoppedAnimation<Color>(
          //           MYColor.secondary,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 5.0,
          // ),
          mediationController.listmediations.isEmpty
              ? Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'no_mediation_orders'.tr,
                    style: TextStyle(
                        fontFamily: 'cairo_regular',
                        color: MYColor.grey,
                        fontSize: 18.0),
                  ),
                )
              : Expanded(
                  child: Obx(
                    () => LazyLoadScrollView(
                      onEndOfPage: () {
                        mediationController.getMoreMediation();
                      },
                      isLoading: mediationController.lastPage.value,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mediationController.listmediations.length,
                        itemBuilder: (context, i) {
                          final mediationOrder =
                              mediationController.listmediations[i];
                          return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  //height: 80.0,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: MYColor.primary
                                                .withOpacity(0.2),
                                            blurRadius: 5.0,
                                            offset: const Offset(1, 1))
                                      ],
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: MYColor.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'status'.tr,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: MYColor.primary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                color: MYColor.primary
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Row(
                                              children: [
                                                Text(
                                                  mediationOrder.statusText!
                                                      .toLowerCase(),
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: MYColor.primary,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1.0, horizontal: 5.0),
                                        child: Divider(
                                          color:
                                              MYColor.primary.withOpacity(0.3),
                                          thickness: 1.0,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'job'.tr,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: MYColor.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  mediationOrder.job!,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: MYColor.primary,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  'experience'.tr,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: MYColor.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  mediationOrder.experience!,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: MYColor.primary,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'country'.tr,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: MYColor.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  mediationOrder.country!,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: MYColor.primary,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
