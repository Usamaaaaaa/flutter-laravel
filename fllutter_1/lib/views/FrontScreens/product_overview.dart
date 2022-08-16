// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, unnecessary_const, must_be_immutable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, duplicate_ignore, avoid_print

import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:fllutter_1/Providers/AddinCart.dart';
import 'package:fllutter_1/Providers/cartProvider.dart';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/controllers/ProductQuantity.dart';
import 'package:fllutter_1/controllers/insertcart.dart';
import 'package:fllutter_1/models/logincheck.dart';
import 'package:fllutter_1/views/FrontScreens/BottomNavBar.dart';
import 'package:fllutter_1/views/FrontScreens/CartPage.dart';
import 'package:fllutter_1/views/FrontScreens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cartModel.dart';

class ProductOverview extends StatefulWidget {
  final int id;
  final String Pname;
  final String Pimage;
  final int Pprice;
  final String category;
  final String Pdescription;

  const ProductOverview(
      {this.id,
      this.Pname,
      this.Pimage,
      this.Pprice,
      this.Pdescription,
      this.category});

  // const ProductOverview({Key key}) : super(key: key);

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  initPrice() {
    cartP.setInitprice(widget.Pprice);
  }

  bool isloading = false;
  ItemProvider prov;
  Cart cart;
  var cartP;
  int userid;
  String userlog;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    cartP = Provider.of<CartProvider>(context, listen: false);

    prov = Provider.of<ItemProvider>(context, listen: false);
    _getPref();
    initPrice();
    super.initState();
    // _onload();
  }

  ProductQuantity quantity = Get.put(ProductQuantity());

  _getPref() async {
    // print('getpref');
    isloading = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    userid = await pref.getInt("id");
    // print(userid);
    userlog = pref.getString("login");
    _onload();
    setState(() {
      isloading = false;
    });
  }

  _onload() async {
    quantity.quantityCount();
    prov.settotal(0, 0);
    isloading = true;
    // ignore: unnecessary_new
    InsertCart insert = new InsertCart();

    if (!userid.isEqual(null)) {
      var res = await insert.getData(userid, 'getcart');
      List<dynamic> body = json.decode(res.body);
      List<dynamic> l = body;
      cartP.setcount(l.length);

      setState(() {
        isloading = false;
      });
    }
  }

  // ignore: missing_return
  Future<bool> _onBackPressed() {
    // print("onback");
    quantity.quantity = 0.obs;
    // setState(() {
    prov.settotal(0, 0);
    // });
    Get.to(() => const MyStatefulWidget());
    // return true;
  }

  @override
  Widget build(BuildContext context) {
    // _onload();
    prov = Provider.of<ItemProvider>(context);

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: isloading
          ? Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: const Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              backgroundColor: Colors.grey.shade300,
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              appBar: AppBar(
                title: const Text("Product Detail"),
                // leading: Icon(Icons.add_card),
                actions: [
                  Padding(
                    padding: EdgeInsets.all(HWPM.p15),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const CartPage());
                        },
                        child: Badge(
                            badgeContent: Consumer<CartProvider>(
                              builder: (context, value, child) {
                                return Text(value.counter.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: HWPM.font20));
                              },
                            ),
                            animationDuration:
                                const Duration(milliseconds: 100),
                            child: const Icon(Icons.shopping_bag_outlined)),
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                widget.Pname.toUpperCase() ?? "",
                                style: const TextStyle(fontSize: 16),
                              ),
                              subtitle: Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                widget.Pprice.toString() + " Pkr",
                                style: const TextStyle(fontSize: 16),
                              ),
                              trailing: Padding(
                                  padding: EdgeInsets.only(right: HWPM.pt10),
                                  child: Consumer<ItemProvider>(
                                    builder: (context, value, child) {
                                      return Text(
                                        "Total Price : " +
                                            value.totalprice.toString() +
                                            r" Pkr",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      );
                                    },
                                  )),
                            ),
                            Container(
                              height: HWPM.h150 + HWPM.h30,
                              padding: EdgeInsets.all(HWPM.p15),
                              child: Image.network(widget.Pimage),
                            ),
                            const SizedBox(
                              height: 5,
                              child: Divider(thickness: 2),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: HWPM.pt40),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        quantity.Decrease();
                                        // print(widget.Pprice);
                                        // quantity.Total(widget.Pprice);
                                        prov.dectotal(widget.Pprice);
                                        // print(prov.totalprice);
                                      },
                                      child: const CircleAvatar(
                                        child: Icon(Icons.remove),
                                      )),
                                  Obx(() => Text(
                                      widget.Pprice.toString() +
                                          " X " +
                                          quantity.quantity.toString(),
                                      style: TextStyle(fontSize: HWPM.font20))),
                                  GestureDetector(
                                    onTap: () {
                                      quantity.Increase();
                                      prov.settotal(widget.Pprice,
                                          quantity.quantity.toInt());
                                      // print(prov.totalprice);
                                      if (quantity.quantity >= 5) {
                                        Get.snackbar(
                                          "Alert",
                                          "you can order 5 product",
                                          colorText: Colors.grey.shade900,
                                          icon: const Icon(Icons.person,
                                              color: Colors.black),
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor:
                                              const Color(0xFF363f93),
                                        );
                                      }

                                      // print(quantity.total.toString());
                                    },
                                    child: const CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (quantity.quantity > 0) {
                                          // print(userid);
                                          if (userlog == "false" &&
                                              userid.isEqual(null)) {
                                            // Get.to(() => RegistrationScreen());
                                            _onCartLoginCheck();
                                          } else {
                                            cartP.setInitprice(widget.Pprice);
                                            AddInCart add = AddInCart();
                                            // AddtoCart();
                                            add
                                                .insert(Cart(
                                                    id: widget.id,
                                                    name: widget.Pname,
                                                    price: prov.totalprice,
                                                    image: widget.Pimage,
                                                    quantity: quantity.quantity
                                                        .toInt(),
                                                    category: widget.category,
                                                    user: userid
                                                    // userid,
                                                    ))
                                                .then((value) {
                                              // print("ll");
                                              if (value['success'] == 'true') {
                                                // print(value['success']);
                                                cartP.addTotal(double.parse(prov
                                                    .totalprice
                                                    .toString()));
                                                cartP.addCounter();
                                              }
                                            }).onError((error, stackTrace) {
                                              // print("err");
                                              _showMsg("Product Not Added");
                                              print(error.toString());
                                            });
                                          }
                                        } else {
                                          _showMsg(
                                              "Quantity must be greater then 1");
                                        }
                                      },
                                      child: Text("Add Cart",
                                          style: TextStyle(
                                            fontSize: HWPM.font20,
                                            fontWeight: FontWeight.w500,
                                          )))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "About This Product",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.all(HWPM.pt10),
                                child: Text(
                                  widget.Pdescription,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              )),
    );
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF363f93),
      content: Text(
        msg,
        style: TextStyle(color: Colors.white, fontSize: HWPM.font20),
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool> _onCartLoginCheck() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.grey.shade300,
                // clipBehavior: ,
                title: const Text("Please Login First"),
                content: const Text(
                  "If you want to login  press on Login ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('No Thanks')),
                  ElevatedButton(
                      onPressed: () {
                        quantity.quantity = 0.obs;
                        setState(() {
                          prov.settotal(0, 0);
                        });
                        Get.to(() => const LoginScreen());
                      },
                      child: const Text('Login')),
                ]));
  }
}
