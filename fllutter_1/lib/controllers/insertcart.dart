import 'dart:convert';

import 'package:http/http.dart' as http;

class InsertCart {
  // emulator
  String baseUrl = "http://10.0.2.2:8000/api/";

  //  for   mobile
  // String baseUrl = "http://192.168.73.142:8000/api/";

  /////////////// insert cart data in database through post http requet /////////
  postCart(data, url) async {
    var fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  /////////////// insert order data in database through post http requet /////////
  postOrder(data, url) async {
    var fullUrl = baseUrl + url;

    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  /////////////// insert Profile data in database through post http requet /////////
  postProfile(data, url) async {
    var fullUrl = baseUrl + url;

    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  /////////////// get data in database through get http requet /////////
  getData(id, url) async {
    var fullUrl = baseUrl + url;
    var data = ['id', id];
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  /////////////// get  data in database through get http requet /////////
  getCartid(url) async {
    var fullUrl = baseUrl + url;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  /////////////// delete cart data in database through post http requet /////////
  deleteData(id, url) async {
    var fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(id), headers: _setHeaders());
  }

  updateCart(data, url) async {
    var fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  // getData(url,id) async {
  //   var fullUrl = baseUrl + url;
  //   return await http.get(Uri.parse(fullUrl),
  //       // body: jsonEncode(data),
  //       headers: _setHeaders());
  // }
}
