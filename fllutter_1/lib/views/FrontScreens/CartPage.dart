// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_print, prefer_interpolation_to_compose_strings, unnecessary_new, avoid_function_literals_in_foreach_calls, unused_element, must_be_immutable, avoid_unnecessary_containers, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:fllutter_1/Providers/AddinCart.dart';
import 'package:fllutter_1/Providers/cartProvider.dart';
import 'package:fllutter_1/controllers/insertcart.dart';
import 'package:fllutter_1/services/payment.dart';
import 'package:fllutter_1/views/FrontScreens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/HWPM.dart';
import '../../models/cartModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _cart;
  bool l = true;
  int id;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    //  this. l = true;
    _getPref();
    _cart = Provider.of<CartProvider>(context, listen: false);
    // _cart.getData(6);
    Future.delayed(const Duration(microseconds: 20), () => {_onload()});
    super.initState();
    /////// stripe init method ////
    StripeService.init();
  }

////// get user id //////////////////////
  _getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getInt("id");
  }

  @override
  Widget build(BuildContext context) {
    //////// snackbar /////////
    _showMsg(msg) {
      final snack = SnackBar(
        backgroundColor: const Color(0xFF363f93),
        content: Text(
          msg,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change!
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }

    final cart = Provider.of<CartProvider>(context);
    /////////// not use any where /////////////////
    Widget BottomBar() {
      return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Consumer<CartProvider>(builder: (context, value, child) {
                return
                    // l
                    // ? const Center(
                    //     child: CircularProgressIndicator(),
                    //   )
                    // :
                    Visibility(
                  visible: value.carttotal.toStringAsFixed(2) == "0.00"
                      ? false
                      : true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Reuseable(
                        title: 'Sub Total',
                        value: 'Pkr ' + value.carttotal.toStringAsFixed(2),
                      )
                    ],
                  ),
                );
              }),
              Consumer<CartProvider>(builder: (context, value, child) {
                return
                    //  l
                    //     ? const Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     :
                    Visibility(
                  visible: value.carttotal.toStringAsFixed(2) == "0.00"
                      ? false
                      : true,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  int amount = cart.carttotal.toInt() * 100;
                                  // int intamount = (amount / 10).ceil();
                                  payWithCard(amount);
                                },
                                child: Text(
                                  'Pay Now',
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  // print(id);
                                  Get.to(CheckOut(
                                    mode: "cod",
                                    id: id,
                                    total: cart.carttotal.toString(),
                                  ));
                                },
                                child: Text(
                                  'Cash On Delivery',
                                  style: Theme.of(context).textTheme.headline5,
                                )),
                          ],
                        )

                        // Reuseable(
                        //   title: 'Sub Total',
                        //   value: "add",
                        // )
                      ],
                    ),
                  ),
                );
              })
            ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        // iconTheme: IconThemeData(color: ),
        title: const Text("MY cart"),
        // leading: Icon(Icons.add_card),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Visibility(
              child: Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(value.counter.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20));
                  },
                ),
                animationDuration: const Duration(milliseconds: 100),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
      ),
      //     bottomNavigationBar:
      //  BottomBar(),
      body: !l
          ? Column(
              children: [
                FutureBuilder(
                    future: cart.getData(id),
                    builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                      // print(snapshot.data);
                      // print("gg");
                      if (snapshot.hasData) {
                        if (snapshot.data.isEmpty) {
////////////////////  cart empty list /////////////////////////
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Image(
                                  image: AssetImage('images/empty.webp')),
                              Text(' Cart is Empty ',
                                  style: Theme.of(context).textTheme.headline6)
                            ],
                          );
                        } else {
/////////////////////cart  data list ///////////

                          return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    // if (snapshot.data[index].state == " ") {
                                    // print('hh');
                                    return Card(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: HWPM.w100,
                                                height: HWPM.h100,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          snapshot.data[index]
                                                              .image),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            HWPM.brcircular10)),
                                              ),
                                              SizedBox(
                                                width: HWPM.pt10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 20),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .name
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            ////// delete cart button //////
                                                            GestureDetector(
                                                                onTap: () {
                                                                  AddInCart()
                                                                      .deleteCart(snapshot
                                                                          .data[
                                                                              index]
                                                                          .id)
                                                                      .then(
                                                                          (value) {
                                                                    print(
                                                                        value);
                                                                    cart.removeCounter();
                                                                    cart.removeTotal(snapshot
                                                                        .data[
                                                                            index]
                                                                        .price
                                                                        .toDouble());
                                                                  });
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .delete))
                                                          ],
                                                        )),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(r"Pkr " +
                                                        snapshot
                                                            .data[index].price
                                                            .toString()),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Category : " +
                                                          snapshot.data[index]
                                                              .category
                                                              .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            right: 15,
                                                            bottom: 10),
                                                        height: 35,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                //////////// increment /////////////////////////
                                                                InkWell(
                                                                    onTap: () {
                                                                      print(
                                                                          'inc');
                                                                      int quantity = snapshot
                                                                          .data[
                                                                              index]
                                                                          .quantity
                                                                          .toInt();
                                                                      int price =
                                                                          cart.initprice;
                                                                      print(
                                                                          price);
                                                                      // snapshot

                                                                      //     .data[
                                                                      //         index]
                                                                      //     .price
                                                                      //     .toInt();
                                                                      quantity++;
                                                                      int newprice =
                                                                          price *
                                                                              quantity;
                                                                      AddInCart()
                                                                          .updateCartQuantity(Cart(
                                                                              id: snapshot.data[index].id,
                                                                              name: snapshot.data[index].name,
                                                                              price: newprice,
                                                                              quantity: quantity,
                                                                              category: snapshot.data[index].category,
                                                                              user: snapshot.data[index].user))
                                                                          .then((vale) {
                                                                        newprice =
                                                                            0;
                                                                        quantity =
                                                                            0;
                                                                        int p =
                                                                            cart.initprice;

                                                                        cart.addTotal(
                                                                            p.toDouble());
                                                                      }).catchError((error) {
                                                                        print(error
                                                                            .toString());
                                                                      });
                                                                    },
                                                                    child: const Icon(
                                                                        Icons
                                                                            .add)),
                                                                Text(snapshot
                                                                    .data[index]
                                                                    .quantity
                                                                    .toString()),
                                                                //////////// decrement /////////////////////////
                                                                InkWell(
                                                                    onTap: () {
                                                                      int quantity = snapshot
                                                                          .data[
                                                                              index]
                                                                          .quantity
                                                                          .toInt();
                                                                      int price =
                                                                          cart.initprice;

                                                                      quantity--;
                                                                      int newprice =
                                                                          price *
                                                                              quantity;
                                                                      if (quantity >
                                                                          0) {
                                                                        AddInCart()
                                                                            .updateCartQuantity(Cart(
                                                                                id: snapshot.data[index].id,
                                                                                name: snapshot.data[index].name,
                                                                                price: newprice,
                                                                                quantity: quantity,
                                                                                category: snapshot.data[index].category,
                                                                                user: snapshot.data[index].user))
                                                                            .then((vale) {
                                                                          newprice =
                                                                              0;
                                                                          quantity =
                                                                              0;
                                                                          int p =
                                                                              cart.initprice;

                                                                          cart.removeTotal(
                                                                              p.toDouble());
                                                                        }).catchError((error) {
                                                                          print(
                                                                              error.toString());
                                                                        });
                                                                      } else {
                                                                        _showMsg(
                                                                            "Quantity must be greater or equal 1");
                                                                      }
                                                                    },
                                                                    child: const Icon(
                                                                        Icons
                                                                            .remove)),
                                                              ],
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
                                    );
                                  }));
                        }
                      } else {
                        return Container();
                      }
                    }),
                /////// bottom botton and total ///////
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ///////////// total ////////////
                        Consumer<CartProvider>(
                            builder: (context, value, child) {
                          return Visibility(
                            visible:
                                value.carttotal.toStringAsFixed(2) == "0.00"
                                    ? false
                                    : true,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Reuseable(
                                  title: 'Sub Total',
                                  value: r'Pkr ' +
                                      value.carttotal.toStringAsFixed(2),
                                )
                              ],
                            ),
                          );
                        }),
                        //////////// pay now cash delivery button /////////
                        Consumer<CartProvider>(
                            builder: (context, value, child) {
                          return Visibility(
                            visible:
                                value.carttotal.toStringAsFixed(2) == "0.00"
                                    ? false
                                    : true,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            int amount =
                                                cart.carttotal.toInt() * 100;
                                            // int intamount = (amount / 10).ceil();
                                            payWithCard(amount);
                                          },
                                          child: Text(
                                            'Pay Now',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            // print(id);
                                            Get.to(CheckOut(
                                              mode: "cod",
                                              id: id,
                                              total: cart.carttotal.toString(),
                                            ));
                                          },
                                          child: Text(
                                            'Cash On Delivery',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          )),
                                    ],
                                  )

                                  // Reuseable(
                                  //   title: 'Sub Total',
                                  //   value: "add",
                                  // )
                                ],
                              ),
                            ),
                          );
                        })
                      ]),
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      // bottomNavigationBar: BottomBar(),
    );
  }

  void payWithCard(int amount) async {
    // StripeService.creatPaymentIntent("5", "USD");
    setState(() {
      l = true;
    });
    var res = await StripeService.payWithNewCard(
        currency: 'USD', amount: amount.toString());
    // Scaffold.of(context).showSnackBar()
    print(res.msg);
    setState(() {
      l = false;
    });
    if (res.success == true) {
      _showMyDialog(res.msg);
    } else {
      _showMsg(res.msg);
    }
  }

  Future<void> _showMyDialog(msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(msg.toString()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Get.to(() => CheckOut(
                      mode: "online",
                      id: id,
                      total: _cart.carttotal.toString(),
                    ));
              },
            ),
          ],
        );
      },
    );
  }

  _onload() async {
    InsertCart insert = new InsertCart();
    // AddInCart insert = new AddInCart();

    // print('onload');
    if (!id.isEqual(null)) {
      var res = await insert.getData(id, 'getcart');
      // print(res.body);
      List<dynamic> body = json.decode(res.body);
      // print(body[0]);
      List<dynamic> l = body;
      int price = 0;

      int count = 0;
      if (body != null) {
        // print(body[0]);
        this.l = false;

        // if (body[0]['price'] != null) {
        l.forEach((element) {
          // print(element['user']);
          // print(element['price']);
          if (element['state'] != 'pending') {
            if (element['user'] == id) {
              count++;
              _cart.setcount(count);
              // print('1');

              price += element['price'];
              // print(price);
            }
          }
        });
        _cart.setTotal(price.toDouble());
      }
    }
    // }
    // print(l);
    // if(body)
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF363f93),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class Reuseable extends StatelessWidget {
  String title, value;
  Reuseable({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
