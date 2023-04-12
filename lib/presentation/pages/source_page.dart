import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/constants/size_constant.dart';
import '../../infrastructure/navigation/routes.dart';
import '../controllers/sources_controller.dart';

class SourcePage extends GetView<SourcesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("News"),
        ),
        body: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'News Source',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.listSources.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.ARTICLES,
                            arguments: controller.listSources[index].id);
                      },
                      child: Card(
                        elevation: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.listSources[index].name
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    GapConstants.gapH10,
                                    Text(
                                        'Country : ${controller.listSources[index].country.toString().toUpperCase()}'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    controller.listSources[index].description
                                        .toString(),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
