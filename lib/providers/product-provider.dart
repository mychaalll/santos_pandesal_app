import 'package:flutter/material.dart';
import 'package:santos_pandesal_app/models/product.dart';

class ProductProvider extends ChangeNotifier {
  Product _currentProduct = Product(name: '', price: 0.0, thumbnail: '', details: '');

  Product get currentProduct => _currentProduct;

  void setCurrentProduct(Product product) {
    _currentProduct = product;
    notifyListeners();
  }
}