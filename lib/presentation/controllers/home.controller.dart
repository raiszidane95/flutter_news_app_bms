import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/constants/validation_constants.dart';
import '../../infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final titleKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  String? emptyValidator(String v) {
    if (v.isEmpty) {
      return ValidationConstants.cantEmpty;
    } else {
      return null;
    }
  }

  void onClickFind(String value) {
    try {
      if (titleKey.currentState!.validate()) {
        Get.toNamed(Routes.SEARCHRESULT, arguments: searchController.text);
        searchController.clear();
      }
    } catch (e) {
      print(e);
    }
  }
}
