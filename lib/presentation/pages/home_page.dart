import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/constants/button_constants.dart';
import '../../domain/entities/cart/utils.dart';
import '../../infrastructure/navigation/routes.dart';
import '../controllers/home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("News"),
        actions: [
          IconButton(
            onPressed: () {
              _showSearchDialog();
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: const Text(
              'List Of Category \nNews Sources',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5),
              itemCount: listOfCategory.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SOURCES,
                          arguments: listOfCategory[index]["code"]);
                    },
                    child: Obx(() => Container(
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    listOfCategory[index]["imageUrl"]!),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(listOfCategory[index]["name"].toString(),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))));
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Search Content'),
        content: Form(
          key: controller.titleKey,
          child: TextFormField(
            controller: controller.searchController,
            keyboardType: TextInputType.text,
            maxLines: 1,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'search'),
            validator: (v) => controller.emptyValidator(v!),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.searchController.clear();
              Get.back();
            },
            child: const Text(
              ButtonConstants.cancel,
              style: TextStyle(color: Colors.red),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13), color: Colors.red),
            child: TextButton(
              onPressed: () =>
                  controller.onClickFind(controller.searchController.text),
              child: const Text(
                ButtonConstants.find,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
