import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/welcome/controllers/welcome_controller.dart';
import 'package:musaneda/components/hourly/welcome/welcome_card.dart';
import 'package:musaneda/config/constance.dart';
import 'package:musaneda/config/myColor.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: controller,
      builder: (controller) => Scaffold(
        body: SafeArea(
            child: Container(
              color: MYColor.primary.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.only(left:5.0 , right: 5.0,bottom: 5.0),
                child: Column(
                          children: [
                const SizedBox(
                  height: 15.0,
                ),
                Center(child: Image.asset(
                  'assets/images/hamaLogo.png',
                  height: 60.0,
                  width: 150.0,
                  //fit: BoxFit.fill,
                  )),
                  const SizedBox(height: 5.0,),
                /*
                LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            MYColor.primary,
                            MYColor.primary.withOpacity(0.5),
                          ]),
                          SweepGradient(
                        center: Alignment.center,
                        startAngle: 1.0,
                        endAngle: 6.0,
                        tileMode: TileMode.repeated,
                        colors: [
                            MYColor.primary,
                            MYColor.primary.withOpacity(0.5),
                          ])
                          */
                Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    alignment: Alignment.center,
                    height: Get.height / 4,
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.center,
                        tileMode: TileMode.mirror,
                        // focalRadius: 6.0,
                        // radius: 0.2,
                        colors: [
                            MYColor.primary,
                            MYColor.primary.withOpacity(0.5),
                          ])
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0 ,right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      controller.greetings(),
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: MYColor.secondary1,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      Constance.instance.name,
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          color: MYColor.white,
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 10.0 , left:10.0),
                                child: Image.asset(
                                  'assets/images/sunrise2.png',
                                  height: 70,
                                  width: 70,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                 Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      WelcomeCard(
                        title: 'hama_offers'.tr, 
                        description: 'one_time_visit'.tr,
                        image: 'assets/images/maid.jpg',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      WelcomeCard(
                        title: 'stayin_offers'.tr,
                        description: '3month_maid'.tr,
                        image: 'assets/images/maid1.jpeg',
                      ),
                    ],
                  ),
                ))
                          ],
                        ),
              ),
            )),
      ),
    );
  }
}
