// ignore_for_file: file_names, unused_import, avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:fllutter_1/controllers/insertcart.dart';
import 'package:fllutter_1/models/cartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'cartProvider.dart';

class AddInCart {
  // use file
  // void setCart({
  //   int id,

  // })

////////////// insert cart data through model  in this controller ///////////////

  Future<Map<String, dynamic>> insert(Cart cart) async {
    var data = cart.toMap();

    var res = await InsertCart().postCart(data, "cart");
    var body = json.decode(res.body);
    // print(body);
    return body;
  }

////////////// get cart data through model  in this controller ///////////////
  Future<List<Cart>> getCart(id) async {
    var res = await InsertCart().getData(id, 'getcart');
    List<dynamic> bod = json.decode(res.body);

    // print(bod);
    return bod.map((e) => Cart.fromMap(e)).toList();
  }

  // List<Cart> getCartId(id) async {
  //   var res = await InsertCart().getCartid('getcart/' + id);
  //   List<Cart> bod = json.decode(res.body);
  //   return bod;
  //   // print(bod);
  //   // return bod.map((e) => Cart.fromMap(e)).toList();
  //   // return body as Future<List<Cart>>;
  //   // cartlist.add(body.map((e) => Cart.fromMap(e)).toList());
  // }

  dynamic deleteCart(int id) async {
    var res = await InsertCart().deleteData(id, 'deletecart');
    var bod = json.decode(res.body);
    return bod;
    // print(bod);
  }

  dynamic updateCartQuantity(Cart cart) async {
    var data = cart.toMap();
    var res = await InsertCart().updateCart(data, 'updatecart');
    var bod = json.decode(res.body);
    print(bod);
    return bod;
  }
}
