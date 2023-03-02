import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/product.dart';
import '../model/productDetails.dart';
import 'Product_Provider.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<Product> _item = [];

  List<Product> get items {
    return [..._item];
  }

   Map<String, dynamic> _itemsDetails = {};

   Map<String, dynamic> get itemsDetails {
    return {..._itemsDetails};
  }

  Future<void> fetchTheProducts() async {
    const url = 'https://mobi.maaxkart.com/call-back-products-by-loc';
    try {
      final response = await http.get(Uri.parse(url));

      print("Data to fetch");

      final addProducts = json.decode(response.body);

//  print(addProducts);
      List<Product> loadedItems = [];
      for (var dataJson in addProducts) {
        loadedItems.add(Product.fromJson(dataJson));
      }

      _item = loadedItems;
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  Future<void> productDetailFetch(id) async {
    const url = 'https://mobi.maaxkart.com/call-back-product-by-id';
    var map = new Map<String, dynamic>();
    map['product_id'] = id;
    map['cust_id'] = '17';

    try {
      final response = await http.post(Uri.parse(url), body: map);

      final addProducts = json.decode(response.body) ;
     
     print(addProducts);

      _itemsDetails = addProducts;
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
