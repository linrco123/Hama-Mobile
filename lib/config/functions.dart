import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/config/myColor.dart';

Future<bool> exitAlertApp() {
  Get.defaultDialog(
      backgroundColor: MYColor.primary,
      title: 'alert'.tr,
      titleStyle: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          //decoration: TextDecoration.underline,
          color: Colors.white),
      middleText: 'question_close'.tr,
      middleTextStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('ok'.tr),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('cancel'.tr)),
      ]);

  return Future.value(true);
}

String normalizeArabicNumbers(String text) {
  // Mapping Arabic-Indic numerals to Western Arabic numerals
  const Map<String, String> arabicToEnglishNumerals = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  // Replace each Arabic numeral with the corresponding English numeral
  arabicToEnglishNumerals.forEach((arabicNum, englishNum) {
    text = text.replaceAll(arabicNum, englishNum);
  });

  return text;
}

bool containsArabicNumerals(String text) {
  // Check for Arabic-Indic numerals (٠-٩)
  final arabicRegex = RegExp(r'[\u0660-\u0669]');
  return arabicRegex.hasMatch(text);
}
