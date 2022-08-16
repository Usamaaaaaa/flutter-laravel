// ignore_for_file: file_names, avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fllutter_1/controllers/homecontroller.dart';
import 'package:fllutter_1/models/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> maleProductlist = [];

  ProductModel productModel;

  bool isloading = true;
  String _mcategory;
  String get mcat => _mcategory;
  String _fcategory;
  String get fcat => _fcategory;
  String _ocategory;
  String get ocat => _ocategory;
  // set category value of males /////////////
  void setCategorymale(String val) {
    _mcategory = val;
    notifyListeners();
  }

  // set category value of females /////////////
  void setCategoryfemale(String val) {
    _fcategory = val;
    notifyListeners();
  }

  // set category value of others /////////////
  void setCategoryother(String val) {
    _ocategory = val;
    notifyListeners();
  }

  // get data from database where  category  value is male through api  /////////////
  fetchMaleProduct() async {
    List<ProductModel> mlist = [];
    var res = await Home().getData('home');
    var body = json.decode(res.body);
    // print(body);
    if (body['success'] == 'true') {
      isloading = false;
      List<dynamic> data = body["data"];
      // print(data.length);

      data.forEach((element) {
        // print('${element['category']}');
        if (element['category'] == 'male') {
          setCategorymale("male");
          productModel = ProductModel(
            id: element["id"],
            productname: element["name"],
            category: element["category"],
            price: element["price"],
            pimage: element["image"],
            pdesc: element["description"],
          );

          mlist.add(productModel);
        }
      });
      // isloading = false;
      maleProductlist = mlist;
      notifyListeners();
    }
  }

  Future<List<ProductModel>> get maleProductList {
    return maleProductlist as Future<List<ProductModel>>;
  }

  //////////////  female category data /////////////////

  List<ProductModel> femaleProductlist = [];

  // get data from database where  category  value is female through api  /////////////
  fetchFemaleProduct() async {
    List<ProductModel> mlist = [];
    var res = await Home().getData('home');
    var body = json.decode(res.body);
    // print(body);
    if (body['success'] == 'true') {
      isloading = false;
      List<dynamic> data = body["data"];

      data.forEach((element) {
        // print('${element['category']}');
        if (element['category'] == 'female') {
          setCategoryfemale("female");
          productModel = ProductModel(
            id: element['id'],
            productname: element["name"],
            category: element["category"],
            price: element["price"],
            pimage: element["image"],
            pdesc: element["description"],
          );

          mlist.add(productModel);
        }
      });
      femaleProductlist = mlist;
      notifyListeners();
    }
  }

  List<ProductModel> get femaleProductList {
    return femaleProductlist;
  }

  //////////////  other category data /////////////////

  List<ProductModel> otherProductlist = [];

  // get data from database where  category  value is other through api  /////////////
  fetchOtherProduct() async {
    List<ProductModel> mlist = [];
    var res = await Home().getData('home');
    var body = json.decode(res.body);
    // print(body);
    if (body['success'] == 'true') {
      isloading = false;
      List<dynamic> data = body["data"];
      data.forEach((element) {
        // print('${element['category']}');
        if (element['category'] == 'other') {
          setCategoryother("other");
          productModel = ProductModel(
            id: element['id'],
            productname: element["name"],
            category: element["category"],
            price: element["price"],
            pimage: element["image"],
            pdesc: element["description"],
          );

          mlist.add(productModel);
        }
      });
      otherProductlist = mlist;
      notifyListeners();
    }
  }

  List<ProductModel> get otherProductList {
    return otherProductlist;
  }

//////////////   cart data /////////////////

  //////////////  all category data /////////////////

  List<ProductModel> allProductlist = [];

  // get data from database all  category through api  /////////////
  fetchAllProduct() async {
    List<ProductModel> mlist = [];
    var res = await Home().getData('home');
    var body = json.decode(res.body);
    // print(body);
    if (body['success'] == 'true') {
      List<dynamic> data = body["data"];
      data.forEach((element) {
        productModel = ProductModel(
          id: element['id'],
          productname: element["name"],
          category: element["category"],
          price: element["price"],
          pimage: element["image"],
          pdesc: element["description"],
        );
        // isloading = false;

        mlist.add(productModel);
        // }
      });
      allProductlist = mlist;
      notifyListeners();
    }
  }

  List<ProductModel> get allProductList {
    return allProductlist;
  }
}
