import '../../entities/cart/cart_model.dart';
import '../../repositories/cart/cart_repository.dart';

class GetCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  Future<CartModel> call() {
    return _cartRepository.getListCart();
  }
}
