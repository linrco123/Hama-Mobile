import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/hourly_service/packages/paclages_model.dart';
import 'package:musaneda/config/myColor.dart';

class MyPackageCard extends StatelessWidget {
  final PackagesModel package;
  final bool isActive;
  final void Function()? onTap;
  const MyPackageCard(
      {super.key, required this.package, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        //height: 80.0,
        width: Get.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: MYColor.primary.withOpacity(0.2),
                  blurRadius: 5.0,
                  offset: const Offset(1,1))
            ],
            borderRadius: BorderRadius.circular(5.0),
            color: isActive ? MYColor.primary : MYColor.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  package.name,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: isActive ? MYColor.white : MYColor.primary,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: isActive
                          ? MYColor.white.withOpacity(0.3)
                          : MYColor.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    package.price,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: isActive ? MYColor.white : MYColor.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
              child: Divider(
                color: isActive
                    ? MYColor.white.withOpacity(0.3)
                    : MYColor.primary.withOpacity(0.3),
                thickness: 1.0,
              ),
            ),
            Text(
              package.period,
              style: TextStyle(
                  fontSize: 14.0,
                  color: isActive ? MYColor.white : MYColor.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('from'.tr,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: isActive ? MYColor.white : MYColor.primary,
                          fontWeight: FontWeight.bold)),
                ),
                Text(
                  package.from,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: isActive ? MYColor.white : MYColor.primary,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('to'.tr,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: isActive ? MYColor.white : MYColor.primary,
                            fontWeight: FontWeight.bold))),
                Text(
                  package.to,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: isActive ? MYColor.white : MYColor.primary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  package.workingHours.toString(),
                  style: TextStyle(
                      fontSize: 14.0,
                      color: isActive ? MYColor.white : MYColor.primary,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  'hours'.tr,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: isActive ? MYColor.white : MYColor.primary,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
