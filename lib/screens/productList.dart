import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Product_Provider.dart';
import '../widget/productlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _init = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<ProductProvider>(context).fetchTheProducts().then((_) {
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
          : const Productlist(),
    );
  }
}
