import '../../entities/news/news_model.dart';

abstract class NewsRepository {
  Future<NewsModel> getListNews(
      {required int page, required String sources, String? searchKey});
}
