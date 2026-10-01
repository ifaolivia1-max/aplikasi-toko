import 'package:flutter/material.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';
import '../helpers/db_helper.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> fetchCartItems() async {
    _items = await DBHelper().getCartItems();
    notifyListeners();
  }

  Future<void> addToCart(Product product) async {
    await DBHelper().addToCart(product);
    await fetchCartItems();
  }

  Future<void> updateQuantity(int id, int newQuantity) async {
    if (newQuantity <= 0) {
      await DBHelper().deleteCartItem(id);
    } else {
      await DBHelper().updateCartQuantity(id, newQuantity);
    }
    await fetchCartItems();
  }

  Future<void> removeItem(int id) async {
    await DBHelper().deleteCartItem(id);
    await fetchCartItems();
  }
}