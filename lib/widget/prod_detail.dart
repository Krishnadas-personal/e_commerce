import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Product_Provider.dart';
import '../provider/product_detail_provider.dart';
import '../screens/product_details.dart';

class ProdDet extends StatelessWidget {
  const ProdDet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductDetailProvider>(context);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.network('https://admin.maaxkart.com/' + prod.item['image']),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(' Rs: ${prod.itemPrice}'),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () {
                        if (int.parse(prod.item['qty']) > 1) {
                          prod.quantityAdjustment(Icons.remove);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(Icons.remove, size: 15),
                      )),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text('${prod.item['qty']}'),
                  const SizedBox(
                    width: 12.0,
                  ),
                  InkWell(
                      onTap: () {
                        prod.quantityAdjustment(Icons.add);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Card(
          color: Colors.red[400],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(prod.item['pro_name']),
              Text(
                'Grand Total: '+(int.parse(prod.item['qty']) * int.parse(prod.itemPrice))
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
