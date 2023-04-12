import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: Text("News"),
      ),
      body: Column(
        children: [
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
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: Get.height * 0.2,
                                  width: Get.width,
                                  child: Image.network(
                                    controller.listArticle[index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                controller.listArticle[index].title!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
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
              ? Center(child: CircularProgressIndicator())
              : SizedBox.shrink()),
        ],
      ),
    );
  }
}
