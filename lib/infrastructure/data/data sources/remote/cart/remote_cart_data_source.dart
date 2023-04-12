import 'package:get/get.dart';

import '../../../../../domain/core/utils/snackbar.util.dart';
import '../../../../../domain/entities/cart/cart_model.dart';

class RemoteCartDataSource {
  final _connect = Get.find<GetConnect>();

  String get _get => '/api/v1/cart/get_list_cart';

  Future<CartModel> getListCart() async {
    final response =
        await _connect.get(_get, decoder: (data) => CartModel.fromJson(data));
    if (!response.hasError) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(message: response.statusCode.toString());
    }
  }
}
