import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/controllers/language_controller.dart';
  import 'package:musaneda/app/routes/app_pages.dart';
import 'package:musaneda/components/hourly/return_back_btn.dart';

import '../../../../components/myCupertinoButton.dart';
import '../../../../components/myServices.dart';
import '../../../../config/myColor.dart';
import '../controllers/musaneda_controller.dart';

class MusanedaView extends GetView<MusanedaController> {
  const MusanedaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MusanedaController>(
            init: controller,
            builder: (_) {
              return Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const DetailScreen(),
                              arguments: controller.musanedaData.image,
                            );
                          },
                          child: Hero(
                            tag: 'imageHero',
                            child: Container(
                              height: double.infinity,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                // color: Colors.grey,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(8),
                                ),

                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    controller.musanedaData.image!,
                                  ),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: const Stack(
                                children: [
                                  Positioned(
                                      top: 50,
                                      right: 10,
                                      child: CircledBackButton()),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 20, right: 20),
                            child: Container(
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: MYColor.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          LanguageController.I.getLocale == "en"
                                              ? controller
                                                  .musanedaData.name!.en!
                                                  .substring(
                                                    0,
                                                    controller
                                                                .musanedaData
                                                                .name!
                                                                .en!
                                                                .length >
                                                            20
                                                        ? 20
                                                        : controller
                                                            .musanedaData
                                                            .name!
                                                            .en!
                                                            .length,
                                                  )
                                                  .toLowerCase()
                                              : controller
                                                  .musanedaData.name!.ar!
                                                  .substring(
                                                    0,
                                                    controller
                                                                .musanedaData
                                                                .name!
                                                                .ar!
                                                                .length >
                                                            20
                                                        ? 20
                                                        : controller
                                                            .musanedaData
                                                            .name!
                                                            .ar!
                                                            .length,
                                                  )
                                                  .toLowerCase(),
                                          style: TextStyle(
                                            color: MYColor.buttons,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                            "assets/images/icon/video.svg",
                                            width: 30,
                                            height: 30,
                                            color: MYColor.icons,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            // controller.changeIsReady(false);
                                            controller
                                                .createFileOfPdfUrl(controller
                                                    .musanedaData.resume!)
                                                .then((f) {
                                              // controller.changeIsReady(true);
                                              Get.toNamed(
                                                Routes.RESUME,
                                                arguments: f.path,
                                              );
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            "assets/images/icon/pdf.svg",
                                            width: 30,
                                            height: 30,
                                            color: MYColor.icons,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "education".tr,
                                              style: TextStyle(
                                                color: MYColor.buttons,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              LanguageController.I.getLocale ==
                                                      "en"
                                                  ? "${controller.musanedaData.education!.name!.en}"
                                                  : "${controller.musanedaData.education!.name!.ar}",
                                              style: TextStyle(
                                                color: MYColor.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "age".tr,
                                              style: TextStyle(
                                                color: MYColor.buttons,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "${controller.musanedaData.age} ${"year".tr} ",
                                              style: TextStyle(
                                                color: MYColor.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "nationality".tr,
                                              style: TextStyle(
                                                color: MYColor.buttons,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              LanguageController.I.getLocale ==
                                                      "en"
                                                  ? "${controller.musanedaData.nationality!.name!.en}"
                                                  : "${controller.musanedaData.nationality!.name!.ar}",
                                              style: TextStyle(
                                                color: MYColor.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      // top: Get.height / 2.3,
                      //bottom: 20,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            // height: 80,
                            child: Text(
                              LanguageController.I.getLocale == "en"
                                  ? "${controller.musanedaData.description!.en}"
                                  : "${controller.musanedaData.description!.ar}",
                              style: TextStyle(
                                color: MYColor.texts,
                                fontSize: 12,
                                fontFamily: 'cairo_light',
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'services_include'.tr,
                          style: TextStyle(
                            color: MYColor.buttons,
                            fontSize: 16,
                            fontFamily: 'cairo_medium',
                          ),
                        ),
                        const SizedBox(height: 15),
                        const MyServices(left: 0, right: 0),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Text(
                            'language'.tr,
                            style: TextStyle(
                              color: MYColor.buttons,
                              fontSize: 12,
                              fontFamily: 'cairo_medium',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1, bottom: 5),
                          child: Text(
                            LanguageController.I.getLocale == 'en'
                                ? 'English'.tr
                                : 'انجليزي'.tr,
                            style: TextStyle(
                              color: MYColor.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1, bottom: 10),
                          child: Text(
                            LanguageController.I.getLocale == 'en'
                                ? 'Intermediate arabic'.tr
                                : 'العربية بمستوى جيد'.tr,
                            style: TextStyle(
                              color: MYColor.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: MyCupertinoButton(
                              btnColor: MYColor.buttons,
                              txtColor: MYColor.white,
                              fun: () {
                                //ComplaintController.I.getComplaints();
                                Get.toNamed(Routes.ORDER,
                                    arguments: controller.musanedaData);
                              },
                              text: "service_request".tr,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'imageHero',
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: Get.arguments,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: MYColor.primary,
                      strokeWidth: 0.1,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const Positioned(top: 100, right: 10, child: CircledBackButton()),
          ],
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
