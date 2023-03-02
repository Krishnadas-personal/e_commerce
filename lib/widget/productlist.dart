import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Product_Provider.dart';
import '../screens/product_details.dart';

class Productlist extends StatelessWidget {
  const Productlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context).items;

    return ListView.builder(
      itemCount: prod.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        // create:(ctx)=> Product(),
        // ignore: deprecated_member_use
        value: prod[index],
        child: Card(
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, ProductDetial.routeName,
                  arguments: prod[index].id);
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://admin.maaxkart.com/' + prod[index].image.toString()),
            ),
            title: Text(prod[index].proName.toString()),
            subtitle: Text(prod[index].companyName.toString()),
            trailing: Text('Rs: ' + prod[index].price.toString()),
          ),
        ),
      ),
    );
  }
}
