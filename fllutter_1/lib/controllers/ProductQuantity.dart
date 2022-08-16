// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, await_only_futures

import 'dart:async';

import 'package:get/get.dart';

class ProductQuantity extends GetxController {
  // RxInt quantity = 1.obs;
  var quantity = 0.obs;
  var t;
  var total = 0.obs;
  //////////// set quantity of product  through get x package//////////
  Future<void> quantityCount() async {
    quantity = 0.obs;

    update();
  }

  // increase quantity of product  through get x package //////
  Future<void> Increase() async {
    if (quantity < 5) {
      quantity = await quantity++;
    }
    update();
  }

  // increase quantity of product  through get x package ///////
  void Decrease() async {
    if (quantity > 0) {
      quantity = await quantity--;
    }
    // print(quantity);
    update();
  }

  // set total price  through get x package
  Future<void> Total(int price) async {
    // total = price+q;
    // t =;
    total = await t;
    update();
  }
}
