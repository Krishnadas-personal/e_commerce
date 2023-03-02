import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/productDetails.dart';

import 'package:http/http.dart' as http;

class ProductDetailProvider with ChangeNotifier {
  Map<String, dynamic> _items = {};

  Map<String, dynamic> get item {
    return {..._items};
  }

  int get cartLength {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;

    _items.forEach((key, cartitems) {
      total += cartitems.price * cartitems.quantity;
    });
    return total;
  }

  String get itemPrice {
    String price = '0';

    if (_items['price'] == '0') price = '80';

    return price;
  }

  void addToCart(
    String productId,
    String productTitle,
    double productPrice,
  ) {
    notifyListeners();
  }

  void quantityAdjustment(IconData icon) {
    int qty = 0;
    if (icon == Icons.add) {
      qty = int.parse(_items['qty']) + 1;
      
      _items['qty'] = qty.toString();
    } else {
      qty = int.parse(_items['qty']) - 1;
      _items['qty'] = qty.toString();
    }

    notifyListeners();
  }

  // void clear() {
  //   _items = {};
  //   notifyListeners();
  // }

  Future<void> productDetailFetch(id) async {
    const url = 'https://mobi.maaxkart.com/call-back-product-by-id';
    var map = new Map<String, dynamic>();
    map['product_id'] = id;
    map['cust_id'] = '17';

    try {
      final response = await http.post(Uri.parse(url), body: map);

      final addProducts = json.decode(response.body);

      print(addProducts.toString());
      print('addProducts.toString()');
      _items = addProducts;
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
