import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/core/utils/snackbar.util.dart';
import '../../domain/entities/news/news_model.dart';
import '../../domain/uses_cases/get_news_use_case.dart';

class SearchResultController extends GetxController {
  final GetNewsUseCase _getNewsUseCase;
  SearchResultController(this._getNewsUseCase);
  RxList<Article> listArticle = <Article>[].obs;
  RxString sources = ''.obs;
  final args = Get.arguments;
  RxString seacrhKey = ''.obs;
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getNews();
    scrollController = ScrollController()..addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page++;
      getNews();
    }
  }

  Future<void> getNews() async {
    try {
      seacrhKey.value = args;
      isLoading.toggle();
      if (page.value > 100) {
        isLoading.toggle();
        return;
      }

      final news = await _getNewsUseCase.call(
          page: page.value, sources: sources.value, searchKey: seacrhKey.value);

      final articlesData = news.articles!;

      if (page.value == 1) {
        listArticle.value = articlesData;
      } else {
        listArticle.addAll(articlesData);
      }

      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      SnackbarUtil.showError(message: e.toString());
    }
  }
}
