import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  Product({
    this.id,
    this.proName,
    this.price,
    this.sellingPrice,
    this.qty,
    this.attribute,
    this.image,
    this.categoryId,
    this.categoryName,
    this.shopId,
    this.companyName,
    this.taluk,
    this.longitude,
    this.latitude,
  });

  final String? id;
  final String? proName;
  final String? price;
  final String? sellingPrice;
  final String? qty;
  final dynamic attribute;
  final String? image;
  final String? categoryId;
  final String? categoryName;
  final String? shopId;
  final String? companyName;
  final String? taluk;
  final String? longitude;
  final String? latitude;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        proName: json["pro_name"],
        price: (json["price"] == "0") ? "80" : json["price"],
        sellingPrice: json["selling_price"],
        qty: json["qty"],
        attribute: json["attribute"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        shopId: json["shop_id"],
        companyName: json["company_name"],
        taluk: json["taluk"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );
}
