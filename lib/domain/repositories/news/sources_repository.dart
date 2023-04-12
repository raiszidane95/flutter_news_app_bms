import '../../entities/news/sources_model.dart';

abstract class SourcesRepository {
  Future<SourcesModel> getListSource({
    required String category,
  });
}
