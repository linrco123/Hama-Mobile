import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/order_details/controllers/orderdetails_controller.dart';
import 'package:musaneda/components/hourly/return_back_btn.dart';
import 'package:musaneda/components/myInkWell.dart';
import 'package:musaneda/config/myColor.dart';

class OrderDetailsView extends GetView<OrderdetailsController> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MYColor.primary.withOpacity(0.1),
        title: Text("order_details".tr),
        leading: ReturnButton(color: MYColor.primary, size: 20.0),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: Get.height,
        width: Get.width,
        color:MYColor.primary.withOpacity(0.1),
        child: GetBuilder(
          init: controller,
          builder: (controller) => Column(
            children: [
              Card(
                child: Container(
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('11111111111111111111'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('2222222222222222222'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('3333333333333333333'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('4444444444444444444'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
             myInkWell(color: MYColor.primary,font: '',fun: (){},size: 18.0,text: 'استكمال الطلب والدفع اونلاين'),
             myInkWell(color: MYColor.primary,font: '',fun: (){},size: 18.0,text:' استكمال الطلب والدفع عبر مدى عند الاستلام'),      
             myInkWell(color: MYColor.primary,font: '',fun: (){},size: 18.0,text:' استكمال الطلب والدفع عبر طريق حوالة بنكية'),      

            
            
            ],
          ),
        ),
      ),
    );
  }
}
