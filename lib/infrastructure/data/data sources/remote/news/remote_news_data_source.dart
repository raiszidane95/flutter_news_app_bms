import 'package:get/get.dart';

import '../../../../../domain/core/constants/storage.constants.dart';
import '../../../../../domain/core/utils/snackbar.util.dart';
import '../../../../../domain/entities/news/news_model.dart';

class RemoteNewsDataSource {
  final GetConnect _connect;

  RemoteNewsDataSource(this._connect);

  Future<NewsModel> getListNews(
      {required int page, required String sources, String? searchKey}) async {
    String apiKey = 'apiKey=${ApiKeyConstants.apiKey}';
    String url = '/everything?page=$page&pageSize=10&';
    url += sources == '' ? '' : 'sources=$sources&';
    url += apiKey;
    print('Print dari searchKey : $searchKey');
    if (searchKey != '') {
      url = "/everything?pageSize=10&page=$page&q=$searchKey&$apiKey";
    }
    print(url);

    final response = await _connect.get(
      url,
      decoder: (data) => NewsModel.fromJson(data),
    );
    if (!response.hasError) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(message: response.statusCode.toString());
    }
  }
}
