import 'package:get/get.dart';

import '../../domain/core/utils/snackbar.util.dart';
import '../../domain/entities/news/sources_model.dart';
import '../../domain/uses_cases/get_sources_use_case.dart';

class SourcesController extends GetxController {
  final GetSourcesUseCase _getSourcesUseCase;
  SourcesController(this._getSourcesUseCase);

  RxList<Source> listSources = <Source>[].obs;
  RxBool isLoading = false.obs;
  final args = Get.arguments;
  final category = ''.obs;
  @override
  void onInit() {
    getSources();
    super.onInit();
  }

  Future<void> getSources() async {
    try {
      isLoading.toggle();
      category.value = args;
      final source = await _getSourcesUseCase.call(category: category.value);
      listSources.value = source.sources!;
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      SnackbarUtil.showError(message: e.toString());
    }
  }
}
