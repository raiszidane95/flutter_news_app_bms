import '../entities/news/news_model.dart';
import '../repositories/news/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository _newsRepository;

  GetNewsUseCase(this._newsRepository);

  Future<NewsModel> call({
    required int page,
    required String sources,
    String? searchKey,
  }) async {
    print('Print searchKey di usecase : $searchKey');
    return await _newsRepository.getListNews(
        page: page, sources: sources, searchKey: searchKey);
  }
}
