import 'package:craftly/data/models/cart_item_model.dart';
import 'package:craftly/data/repository/fetchCart.dart';

Future<CartModel> getCart() async {
  try {
    Map<String, dynamic> rawCartItems = await fetchCart();
    CartModel cartModel = CartModel.fromJson(rawCartItems);
    return cartModel;
  } catch (e) {
    print(e);
  }
}
