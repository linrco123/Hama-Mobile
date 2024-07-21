import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musaneda/app/modules/home/controllers/home_controller.dart';
import 'package:musaneda/app/modules/home/name_language_model.dart';
import 'package:musaneda/components/mySnackbar.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/app_pages.dart';
import '../complaints_model.dart';
import '../providers/complaints_provider.dart';

class ComplaintController extends GetxController {
  static ComplaintController get I => Get.put(ComplaintController());
  var isLoading = false.obs;
  final formComplaintKey = GlobalKey<FormState>();

  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtNotes = TextEditingController();

  @override
  void onInit() {
    getComplaints();
    super.onInit();
  }

  /// Validate Title Name
  validateTitleName(String value) {
    if (value.isEmpty) {
      return "msg_ticket_title_required".tr;
    } else if (value.length < 6) {
      return "msg_ticket_title_most_by_more_than_6_characters".tr;
    }
    return null;
  }

  /// Validate Title Name
  validateNoteName(String value) {
    if (value.isEmpty) {
      return "msg_ticket_note_required".tr;
    } else if (value.length < 16) {
      return "msg_ticket_note_most_by_more_than_16_characters".tr;
    }
    return null;
  }

  var listHigh = List<ComplaintsData>.empty(growable: true).obs;
  var listMedium = List<ComplaintsData>.empty(growable: true).obs;
  var listLow = List<ComplaintsData>.empty(growable: true).obs;

  Future<void> getComplaints() async {
    isLoading(true);
    ComplaintsProvider().getComplaints().then((value) {
      for (var data in value.data as List) {
        if (data.importance == 1) {
          listHigh.add(data);
        }
        if (data.importance == 2) {
          listMedium.add(data);
        }
        if (data.importance == 3) {
          listLow.add(data);
        }
      }
      isLoading(false);
    });

    update();
  }

  var fileName = "".obs;
  var filePath = "".obs;
  var fileExtension = "".obs;
  var fileSize = "".obs;
  var fileBytes = "".obs;
  var fileBase64 = "".obs;

  Future<void> requestPermission() async {
    final PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      selectFile();
    } else if (status.isDenied) {
      await showDialog(
        context: Get.overlayContext!,
        builder: (_) =>
            AlertDialog(
              title: const Text('Permission Required'),
              content: const Text('Please grant permission to select a file.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(Get.context!),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } else if (status.isPermanentlyDenied) {
      await showDialog(
        context: Get.overlayContext!,
        builder: (_) =>
            AlertDialog(
              title: const Text('Permission Required'),
              content: const Text(
                  'Please grant permission to select a file. Go to app settings > permissions and enable storage permission.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(Get.context!),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => openAppSettings(),
                  child: const Text('Settings'),
                ),
              ],
            ),
      );
    }
  }

  void selectFile() async {
    try {
      await FilePicker.platform.clearTemporaryFiles();
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        fileName.value = result.files.single.name;
        filePath.value = result.files.single.path!;
        print('File Name is ${fileName.value}');
        print('File Name is ${filePath.value}');
      } else {
        mySnackBar(
          title: "error".tr,
          message: "msg_your_should_upload_file".tr,
          color: Colors.red,
          icon: Icons.error,
        );
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> uploadFile() async {
    await FilePicker.platform.clearTemporaryFiles();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      List<PlatformFile> files = result.files;
      for (var file in files) {
        fileName.value = file.name;
        filePath.value = file.path!;
        fileExtension.value = file.extension!;
        fileSize.value = file.size.toString();
        fileBytes.value = file.bytes.toString();
        fileBase64.value = file.bytes.toString();
      }
    } else {
      mySnackBar(
        title: "error".tr,
        message: "msg_your_should_upload_file".tr,
        color: Colors.red,
        icon: Icons.error,
      );
    }
    update();
  }

  List<TicketType> ticketTypes = [
    TicketType(
      id: 0,
      name: NameLanguage(
        ar: "اختر نوع التذكرة",
        en: "Select Ticket Type",
      ),
    ),
    TicketType(
      id: 1,
      name: NameLanguage(
        ar: "تذكرة مشكلة",
        en: "Problem Ticket",
      ),
    ),
    TicketType(
      id: 2,
      name: NameLanguage(
        ar: "تذكرة اقتراح",
        en: "Suggestion Ticket",
      ),
    ),
    // TicketType(
    //   id: 3,
    //   name: NameLanguage(
    //     ar: "تذكرة شكوى",
    //     en: "Complaint Ticket",
    //   ),
    // ),
  ];

  var selectedTicketType = 0.obs;

  set setTicketType(int value) => selectedTicketType.value = value;

  List<TicketPriority> ticketPriorities = [
    TicketPriority(
      id: 0,
      name: NameLanguage(
        ar: "اختر الأولوية",
        en: "Select Priority",
      ),
    ),
    TicketPriority(
      id: 1,
      name: NameLanguage(
        ar: "عالية",
        en: "High",
      ),
    ),
    TicketPriority(
      id: 2,
      name: NameLanguage(
        ar: "متوسطة",
        en: "Medium",
      ),
    ),
    TicketPriority(
      id: 3,
      name: NameLanguage(
        ar: "منخفضة",
        en: "Low",
      ),
    ),
  ];

  var selectedTicketPriority = 0.obs;

  set setTicketPriority(int value) => selectedTicketPriority.value = value;

  void removeFile() {
    fileName.value = "";
    filePath.value = "";
    fileExtension.value = "";
    fileSize.value = "";
    fileBytes.value = "";
    fileBase64.value = "";
    update();
  }

  createComplaint() {
    try {
      if (formComplaintKey.currentState!.validate()) {

        if (selectedTicketType.value == 0) {
          mySnackBar(
            title: "error".tr,
            message: "برجاء اختيار نوع التذكرة",
            color: Colors.red,
            icon: Icons.error,
          );
        } else if (selectedTicketPriority.value == 0) {
          mySnackBar(
            title: "error".tr,
            message: "برجاء اختيار الأولوية",
            color: Colors.red,
            icon: Icons.error,
          );
        } else {
          isLoading(true);
          Map map = {
            "name": txtTitle.text,
            "description": txtNotes.text,
            "contract_id": HomeController.I.listContracts.first.id ?? 0,
            "type": selectedTicketType.value,
            "importance": selectedTicketPriority.value,
            "file": fileName.value,
          };
          ComplaintsProvider().postComplaints(map).then(
                (value) {
              if (value == 1) {
                isLoading(false);
                Get.offAllNamed(Routes.HOME);
              }
            },
          );
        }
      }
    } catch (e) {
      return Future.error(e.toString());
    }

    update();
  }
}
class TicketType {
  final int id;
  final NameLanguage name;

  TicketType({
    required this.id,
    required this.name,
  });
}

class TicketPriority {
  final int id;
  final NameLanguage name;

  TicketPriority({
    required this.id,
    required this.name,
  });
}
