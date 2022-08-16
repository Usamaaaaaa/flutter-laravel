// ignore_for_file: file_names, unnecessary_import, prefer_interpolation_to_compose_strings

import 'package:fllutter_1/Providers/ProductProvider.dart';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/views/FrontScreens/product_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Service extends StatefulWidget {
  const Service({Key key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  ProductProvider allprovider;
  @override
  void initState() {
    var allProd = Provider.of<ProductProvider>(context, listen: false);
    allProd.fetchAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    allprovider = Provider.of<ProductProvider>(context);

    // ignore: todo
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text("Offers"),
          centerTitle: true,
        ),
        body: allprovider.isloading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                // children: [
                children: allprovider.allProductList.map((product) {
                  return SafeArea(
                      child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ProductOverview(
                          id: product.id,
                          Pname: product.productname,
                          Pimage: product.pimage,
                          category: product.category,
                          Pprice: product.price,
                          Pdescription: product.pdesc,
                        ));
                      },
                      child: Card(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: HWPM.h100,
                                  width: HWPM.w100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(product.pimage),
                                        opacity: 0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(
                                          product.productname.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(r"Pkr :" + product.price.toString()),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Category : " +
                                            product.category.toString(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin: EdgeInsets.all(HWPM.p15),
                                          height: HWPM.h50,
                                          width: HWPM.w100 + HWPM.w40,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: GestureDetector(
                                              child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                "BOOK NOW",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]));
                }).toList(),
              ));
  }
}
