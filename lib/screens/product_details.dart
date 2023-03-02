import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Product_Provider.dart';
import '../provider/product_detail_provider.dart';
import '../widget/prod_detail.dart';
import '../widget/productlist.dart';

class ProductDetial extends StatefulWidget {
  static const routeName = '/ProductDetails';
  const ProductDetial({Key? key}) : super(key: key);

  @override
  State<ProductDetial> createState() => _ProductDetialState();
}

class _ProductDetialState extends State<ProductDetial> {
  bool _init = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_init) {
      final id = ModalRoute.of(context)!.settings.arguments as String;
      Provider.of<ProductDetailProvider>(context).productDetailFetch(id).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :  ProdDet(),
          
    );
  }
}
