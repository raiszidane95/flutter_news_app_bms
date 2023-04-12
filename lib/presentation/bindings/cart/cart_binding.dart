import 'package:get/get.dart';

import '../../../domain/repositories/cart/cart_repository.dart';
import '../../../domain/uses_cases/cart/get_cart_use_cases.dart';
import '../../../infrastructure/data/data sources/remote/cart/remote_cart_data_source.dart';
import '../../../infrastructure/data/repositories/cart/cart_repository_impl.dart';
import '../../controllers/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteCartDataSource>(() => RemoteCartDataSource());
    Get.lazyPut<CartRepository>(
        () => CartRepositoryImpl(Get.find<RemoteCartDataSource>()));
    Get.lazyPut<GetCartUseCase>(
        () => GetCartUseCase(Get.find<CartRepository>()));

    Get.lazyPut<CartController>(
        () => CartController(Get.find<GetCartUseCase>()));
  }
}
