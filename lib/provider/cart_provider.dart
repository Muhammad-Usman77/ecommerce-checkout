import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrview/model/produ_car.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  increamentQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decreamentQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }
         totalPrice() {
    double myTotal = 0.0; // initial
    for (Product element in _cart) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }
  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
