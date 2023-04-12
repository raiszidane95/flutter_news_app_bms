import '../../../../domain/entities/cart/cart_model.dart';
import '../../../../domain/repositories/cart/cart_repository.dart';
import '../../data sources/remote/cart/remote_cart_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final RemoteCartDataSource _remoteCartDataSource;

  CartRepositoryImpl(this._remoteCartDataSource);

  @override
  Future<CartModel> getListCart() {
    return _remoteCartDataSource.getListCart();
  }
}
