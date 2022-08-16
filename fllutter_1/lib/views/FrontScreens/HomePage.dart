// import 'dart:js';

// ignore_for_file: file_names, prefer_const_constructors, await_only_futures, non_constant_identifier_names, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

// import 'dart:html';
import 'dart:convert';
import 'dart:io';

import 'package:fllutter_1/Providers/ProductProvider.dart';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/controllers/insertcart.dart';
import 'package:fllutter_1/models/logincheck.dart';
import 'package:fllutter_1/views/FrontScreens/DrawerPage.dart';
import 'package:fllutter_1/views/FrontScreens/SingleProduct.dart';
import 'package:fllutter_1/views/FrontScreens/product_overview.dart';
import 'package:fllutter_1/views/FrontScreens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  int count = 1;
  String r, img;
  bool isloading = false;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Are you sure you want to close App"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('No')),
                  ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text('Yes')),
                ]));
  }

  ProductProvider prodProvider;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    var Prod = Provider.of<ProductProvider>(context, listen: false);
    onload();
    Prod.fetchMaleProduct();
    Prod.fetchFemaleProduct();
    Prod.fetchOtherProduct();
    Log();
    super.initState();
  }

  onload() async {
    // isloading = true;
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id = await pre.getInt("id");
    if (!id.isEqual(null)) {
      var res = await InsertCart().getData(id, 'getprofile');
      var bod = json.decode(res.body);
      data = bod;
      if (data['role'] != null) {
        setState(() {
          r = data['Firstname'];
          if (data['image'] != null) {
            img = data['image'];
          }
        });
      }
    } else {
      setState(() {
        r = 'Guest';
        img =
            'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png';
      });
    }
  }

  Log() async {
    var log = Provider.of<ItemProvider>(context, listen: false);
    SharedPreferences pre = await SharedPreferences.getInstance();
    String role = pre.getString("role");
    String v = pre.getString('login');
    log.setLogin(v);
    log.setRole(role);
  }

  @override
  Widget build(BuildContext context) {
    // print("build");
    prodProvider = Provider.of<ProductProvider>(context);

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              Padding(
                padding: EdgeInsets.all(HWPM.pt10),
                child: CircleAvatar(
                  radius: 12,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchItem()));
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 17,
                        color: Colors.black,
                      )),
                ),
              )
            ],
            // leading: Icon(Icons.arrow_back),
          ),
          drawer: Drawer(
            child: DrawerPage(
              role: r.toString(),
              image: img.toString(),
            ),
          ),
          body: prodProvider.isloading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(HWPM.pt10),
                  child: ListView(children: [
                    Container(
                      height: HWPM.h150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/Coats.jpeg'),
                            opacity: 0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: HWPM.pt40),
                                      child: Text(
                                        '20% off',
                                        style: TextStyle(
                                          fontSize: HWPM.font40,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'On All Products',
                                      style: TextStyle(
                                        fontSize: HWPM.font20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(child: Container())
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: HWPM.pv10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<ProductProvider>(
                              builder: (context, male, child) {
                            return male.mcat != null
                                ? Text(
                                    male.mcat.toString().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: HWPM.font20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text("");
                          }),
                          Text(
                            'view all',
                            style: TextStyle(color: Colors.grey[300]),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: prodProvider.maleProductlist.map((product) {
                            if (product != null) {
                              // only single productt
                              return SingleProduct(
                                id: product.id,
                                ProductName: product.productname,
                                Productimage: product.pimage,
                                Productprice: product.price.toInt(),
                                description: product.pdesc,
                                pcategory: product.category,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductOverview(
                                            id: product.id,
                                            Pname: product.productname,
                                            Pimage: product.pimage,
                                            Pprice: product.price.toInt(),
                                            Pdescription: product.pdesc,
                                            category: product.category,
                                          )));
                                },
                              );
                            } else {
                              Text("empty");
                            }
                          }).toList(),
                        )),

                    //   //       //female category start///
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: HWPM.pv10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<ProductProvider>(
                              builder: (context, female, child) {
                            return female.fcat != null
                                ? Text(
                                    female.fcat.toString().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: HWPM.font20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text("");
                          }),
                          Text(
                            'view all',
                            style: TextStyle(color: Colors.grey[300]),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              prodProvider.femaleProductlist.map((fproduct) {
                            // print("gg");
                            return SingleProduct(
                              id: fproduct.id,
                              ProductName: fproduct.productname,
                              Productimage: Uri.decodeFull(fproduct.pimage),
                              Productprice: fproduct.price.toInt(),
                              description: fproduct.pdesc,
                              pcategory: fproduct.category,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductOverview(
                                          id: fproduct.id,
                                          Pname: fproduct.productname,
                                          Pimage: fproduct.pimage,
                                          Pprice: fproduct.price.toInt(),
                                          Pdescription: fproduct.pdesc,
                                          category: fproduct.category,
                                        )));
                              },
                            );
                          }).toList(),
                        )),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: HWPM.pv10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<ProductProvider>(
                              builder: (context, other, child) {
                            return other.ocat != null
                                ? Text(
                                    other.ocat.toString().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: HWPM.font20,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text("");
                          }),
                          Text(
                            'view all',
                            style: TextStyle(color: Colors.grey[300]),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              prodProvider.otherProductlist.map((oproduct) {
                            // print("gg");
                            return SingleProduct(
                              id: oproduct.id,
                              ProductName: oproduct.productname,
                              Productimage: oproduct.pimage,
                              Productprice: oproduct.price.toInt(),
                              description: oproduct.pdesc,
                              pcategory: oproduct.category,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductOverview(
                                          id: oproduct.id,
                                          Pname: oproduct.productname,
                                          Pimage: oproduct.pimage,
                                          Pprice: oproduct.price.toInt(),
                                          Pdescription: oproduct.pdesc,
                                          category: oproduct.category,
                                        )));
                              },
                            );
                          }).toList(),
                        )),
                    //   ]),
                    // ),
                  ]),
                ),
        )
        // ],
        );
  }
}
