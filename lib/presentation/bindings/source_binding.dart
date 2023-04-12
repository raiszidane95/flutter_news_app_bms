import 'package:get/get.dart';

import '../../domain/repositories/news/sources_repository.dart';
import '../../domain/uses_cases/get_sources_use_case.dart';
import '../../infrastructure/data/data sources/remote/news/remote_sources_data_source.dart';
import '../../infrastructure/data/repositories/news/sources_repository_impl.dart';
import '../controllers/sources_controller.dart';

class SourceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteSourceDataSource>(
        () => RemoteSourceDataSource(Get.find<GetConnect>()));
    Get.lazyPut<SourcesRepository>(
        () => SourcesRepositoryImpl(Get.find<RemoteSourceDataSource>()));
    Get.lazyPut<GetSourcesUseCase>(
        () => GetSourcesUseCase(Get.find<SourcesRepository>()));
    Get.lazyPut<SourcesController>(
      () => SourcesController(Get.find<GetSourcesUseCase>()),
    );
  }
}
