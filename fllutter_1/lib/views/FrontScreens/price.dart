// ignore_for_file: non_constant_identifier_names

import 'package:fllutter_1/Providers/ProductProvider.dart';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Price extends StatefulWidget {
  const Price({Key key}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  ProductProvider allProduct;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    var Prod = Provider.of<ProductProvider>(context, listen: false);

    Prod.fetchAllProduct();
    super.initState();
  }

  Widget PriceTile({Container icon, String title, String price}) {
    return Container(
      padding: EdgeInsets.all(HWPM.pt10),
      child: Column(
        children: [
          ListTile(
            leading: icon,
            title: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            // subtitle: Text(r'Rs: ' + price),
            trailing: Text(
              r'Rs: ' + price,
              style: const TextStyle(fontSize: 16),
            ),
            // const Icon(Icons.arrow_forward_ios),
          ),
          const Divider(
            height: 2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    allProduct = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Price list'),
      ),
      body: ListView(
          children: allProduct.allProductList.map((product) {
        return Column(children: [
          // Divider(
          //   height: 4,
          // ),
          PriceTile(
              icon: Container(
                height: HWPM.h50,
                width: HWPM.w50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.pimage),
                      opacity: 0.9),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              title: product.productname,
              price: product.price.toString())
        ]);
      }).toList()),
    );
  }
}
