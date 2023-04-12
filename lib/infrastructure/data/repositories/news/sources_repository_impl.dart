import '../../../../domain/entities/news/sources_model.dart';
import '../../../../domain/repositories/news/sources_repository.dart';
import '../../data sources/remote/news/remote_sources_data_source.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  final RemoteSourceDataSource _remoteSourceDataSource;

  SourcesRepositoryImpl(this._remoteSourceDataSource);

  @override
  Future<SourcesModel> getListSource({
    required String category,
  }) {
    return _remoteSourceDataSource.getListSources(category: category);
  }
}
