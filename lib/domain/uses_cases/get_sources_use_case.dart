import '../entities/news/sources_model.dart';
import '../repositories/news/sources_repository.dart';

class GetSourcesUseCase {
  final SourcesRepository _sourceRepository;

  GetSourcesUseCase(this._sourceRepository);

  Future<SourcesModel> call({
    required String category,
  }) async {
    return await _sourceRepository.getListSource(category: category);
  }
}
