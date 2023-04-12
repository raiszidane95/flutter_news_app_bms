import '../../../../domain/entities/news/news_model.dart';
import '../../../../domain/repositories/news/news_repository.dart';
import '../../data%20sources/remote/news/remote_news_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final RemoteNewsDataSource _remoteNewsDataSource;

  NewsRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future<NewsModel> getListNews(
      {required int page, required String sources, String? searchKey}) {
    print('Print searchKey di repo_impl : $searchKey');
    return _remoteNewsDataSource.getListNews(
        page: page, sources: sources, searchKey: searchKey);
  }
}
