// ignore_for_file: file_names, unused_import, missing_return

import 'dart:developer';

import 'package:fllutter_1/Providers/AddinCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cartModel.dart';

class CartProvider extends ChangeNotifier {
  int _count = 0;
  int get counter => _count;
  double _cartTotal = 0.0;
  double get carttotal => _cartTotal;
  int _initprice;

  int get initprice => _initprice;

  //////// set initailPrice  of product through provider////////
  void setInitprice(int p) {
    _initprice = p;
    // notifyListeners();
  }

  // get perf => null;
  Future<List<Cart>> _cartData;

  Future<List<Cart>> get cartData => _cartData;

  //////// get cart data  through provider////////

  Future<List<Cart>> getData(int id) async {
    _cartData = AddInCart().getCart(id);
    // print(_cartData);
    return _cartData;
  }

  // Future<List<Cart>> setData(List<Cart> c) async {
  //   // print("hh");
  //   // print(AddInCart().getCart());
  //   _cartData = c as Future<List<Cart>>;
  //   notifyListeners();
  //   // print(_cartData);
  //   // return _cartData;
  // }

/////////////  set value in cache through provider /////////
  void _setPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('cartItem', _count);
    pref.setDouble('totalPrice', _cartTotal);
    notifyListeners();
  }

/////////////  get value from cache through provider /////////
  void _getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _count = pref.getInt('cartItem');
    _cartTotal = pref.getDouble('totalPrice');
    notifyListeners();
  }

/////////////  calculate total  through provider  for state management /////////
  void addTotal(double price) {
    _cartTotal = _cartTotal + price;
    _setPref();
    notifyListeners();
  }

/////////////  decrease total  through provider  for state management /////////
  void removeTotal(double price) {
    _cartTotal = _cartTotal - price;
    _setPref();
    notifyListeners();
  }

/////////////  get total  through provider  for state management /////////
  double getTotal(double price) {
    _getPref();
    return _cartTotal;
    // notifyListeners();
  }

/////////////  set total  through provider  for state management /////////
  void setTotal(double price) {
    _setPref();
    _cartTotal = price;
    // notifyListeners();
  }

  void zeroTotal(double price) {
    _cartTotal = price;
    _setPref();
    notifyListeners();
  }

  void setCounter() {
    _count = 0;
    // _setPref();
    notifyListeners();
  }

  void addCounter() {
    _count++;
    _setPref();
    notifyListeners();
  }

  void removeCounter() {
    if (_count > 0) {
      _count--;
      _setPref();
      notifyListeners();
    }
  }

  int getcount() {
    return _count;
  }

  void setcount(int val) {
    _count = val;
    notifyListeners();
  }
}
