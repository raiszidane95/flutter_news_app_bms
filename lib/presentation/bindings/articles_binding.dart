import 'package:get/get.dart';

import '../../domain/repositories/news/news_repository.dart';
import '../../domain/uses_cases/get_news_use_case.dart';
import '../../infrastructure/data/data sources/remote/news/remote_news_data_source.dart';
import '../../infrastructure/data/repositories/news/news_repository_impl.dart';
import '../controllers/articles_controller.dart';

class ArticlesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteNewsDataSource>(
        () => RemoteNewsDataSource(Get.find<GetConnect>()));
    Get.lazyPut<NewsRepository>(
        () => NewsRepositoryImpl(Get.find<RemoteNewsDataSource>()));
    Get.lazyPut<GetNewsUseCase>(
        () => GetNewsUseCase(Get.find<NewsRepository>()));
    Get.lazyPut<ArticlesController>(
      () => ArticlesController(Get.find<GetNewsUseCase>()),
    );
  }
}
