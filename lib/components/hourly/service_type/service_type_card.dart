import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/config/myColor.dart';

class ServiceTypeCard extends StatelessWidget {
  final String title;
  final String description;
  final void Function() function;
  const ServiceTypeCard(
      {super.key,
      required this.title,
      required this.description,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Card(
        elevation: 2.0,
        child: Container(
          height: Get.height * 0.16,
          width: Get.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: MYColor.primary,
                       // fontWeight: FontWeight.bold
                        ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: MYColor.primary,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: MYColor.grey.withOpacity(0.7),
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
  }
}
