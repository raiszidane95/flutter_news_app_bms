import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/constants/size_constant.dart';
import '../controllers/search_result_controller.dart';
import '../widgets/ViewNews.dart';

class SearchResultPage extends GetView<SearchResultController> {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("News"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Showing result of ${controller.args}",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          GapConstants.gapH15,
          Expanded(
            child: Obx(() => ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.listArticle.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: GestureDetector(
                          onTap: () => Get.to(ViewNews(
                            newsUrl: controller.listArticle[index].url,
                          )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: Get.height * 0.2,
                                  width: Get.width,
                                  child: Image.network(
                                    controller.listArticle[index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                controller.listArticle[index].title!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(controller.listArticle[index].source!.name!),
                            ],
                          ),
                        ),
                      )),
                    );
                  },
                )),
          ),
          Obx(() => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
