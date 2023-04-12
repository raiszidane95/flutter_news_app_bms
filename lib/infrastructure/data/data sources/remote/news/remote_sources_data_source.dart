import 'package:get/get.dart';

import '../../../../../domain/core/utils/snackbar.util.dart';
import '../../../../../domain/entities/news/sources_model.dart';

class RemoteSourceDataSource {
  final GetConnect _connect;

  RemoteSourceDataSource(this._connect);

  Future<SourcesModel> getListSources({
    required String category,
  }) async {
    String apiKey = 'apiKey=89cefe04228b430d835a4fd245c6bccc';
    String url = '/top-headlines/sources?';
    url += category == '' ? '' : 'category=$category&';
    url += apiKey;
    print(url);
    final response = await _connect.get(
      url,
      decoder: (data) => SourcesModel.fromJson(data),
    );
    print(response);

    if (!response.hasError) {
      return response.body!;
    } else {
      print(response.statusText);
      throw SnackbarUtil.showError(message: response.statusCode.toString());
    }
  }
}
