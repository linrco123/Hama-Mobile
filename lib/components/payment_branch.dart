import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:musaneda/app/modules/order/controllers/order_controller.dart';
import 'package:musaneda/config/myColor.dart';

class PaymentBranch extends StatelessWidget {
  const PaymentBranch({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.locale!.languageCode == 'ar';
    return Obx(
      () => GestureDetector(
        onTap: () {
          OrderController.I.changepaymentBranchOption();
        },
        child: Container(
          width: double.infinity, // 315,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MYColor.white,
            border: Border.all(
              color: !OrderController.I.paymentBranch.value
                  ? MYColor.grey.withOpacity(0.5)
                  : MYColor.primary,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: MYColor.primary.withOpacity(0.5),
                offset: const Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: isArabic
                ? const EdgeInsets.only(top: 5, right: 20)
                : const EdgeInsets.only(top: 5, left: 20),
            child: Row(
              children: [
                Expanded(
                  child: isArabic
                      ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'payment_branch'.tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    height: 1.5,
                                    fontSize: 17), // Normal font style
                              ),
                            ],
                          ),
                        )
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'payment_branch'.tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    height: 1.5,
                                    fontSize: 16), // Normal font style
                              ),
                            ],
                          ),
                        ),
                ),
                Padding(
                    padding: isArabic
                        ? const EdgeInsets.only(left: 10)
                        : const EdgeInsets.only(right: 10),
                    child: Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/payment-branch.jpg',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: MYColor.primary.withOpacity(0.1),
                                offset: const Offset(1, 0),
                                blurRadius: 5,
                                spreadRadius: 0,
                              ),
                            ]))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
