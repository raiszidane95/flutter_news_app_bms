import 'package:get/get.dart';

import '../../../domain/core/utils/snackbar.util.dart';
import '../../../domain/entities/cart/cart_model.dart';
import '../../../domain/uses_cases/cart/get_cart_use_cases.dart';

class CartController extends GetxController {
  final GetCartUseCase _getCartUseCase;

  CartController(
    this._getCartUseCase,
  );

  RxList<Datum> cartList = <Datum>[].obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCartList();
  }

  Future<void> getCartList() async {
    isLoading.toggle();
    try {
      final cart = await _getCartUseCase.call();
      cartList.addAll(cart.data!);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      SnackbarUtil.showError(message: e.toString());
    }
  }

  Future<void> refreshCartList() async {
    cartList.clear();
    await getCartList();
  }
}
