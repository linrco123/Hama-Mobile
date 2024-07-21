import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/home/controllers/home_controller.dart';
import 'package:musaneda/config/myColor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsConditionsWebview extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              WebViewWidget(controller: controller.webViewController),
              Positioned(
                top: 2.0,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: MYColor.buttons, shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back,
                      color: MYColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    ;
  }
}
