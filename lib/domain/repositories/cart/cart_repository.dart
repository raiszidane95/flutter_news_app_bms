import '../../entities/cart/cart_model.dart';

abstract class CartRepository {
  Future<CartModel> getListCart();
}
