import 'package:flutter/material.dart';
import 'package:santos_pandesal_app/models/product.dart';

class Cart {
  Product product;
  int quantity;

  Cart(this.product, this.quantity);
}

class CartProvider extends ChangeNotifier {
  List<Cart> _cartItems = [];


  //get method
  List<Cart> get cartItems => _cartItems;

  //add to cart
  void addItemToCart(Product product, int quantity) {
    bool productExists = false;

    //check cart if theres an existing product
    for (var item in _cartItems) {
      if (item.product == product) {
        print('Product found');
        print('Product: ${item.product.name}');
        print('Product quantity: ${item.quantity}');
        item.quantity += quantity;
        productExists = true;
        break;
      }
    }

    //if not, add the product
    if (!productExists) {
      _cartItems.add(Cart(product, quantity));
    }
    
    notifyListeners();
  }

  //remove from cart
  void removeCartItem(Product product) {
    _cartItems.removeWhere((item) => item.product == product);
    notifyListeners();
  }

  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }

  //calculate the price of the cart overall
  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

}