// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class Signin {
  //  ###### for emulator ########
  String baseUrl = "http://10.0.2.2:8000/api/";
  //  ###### for mobile ########
  // String baseUrl = "http://192.168.73.142:8000/api/";

///////// insert data through post api in database ///////
  postData(data, url) async {
    var fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

///////// get data through get api in database ///////
  getData(data, url) async {
    var fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
// http://192.168.10.15:8000/api/userorder
  // getData() async {
  //   try {
  //     var response = await http.get(baseUrl);
  //     if (response.statusCode == 200) {
  //       // var data = jsonDecode(response.body);
  //       // print(jsonDecode(response.body));
  //       // print(data['Password']);
  //       return jsonDecode(response.body);
  //     } else {
  //       return Future.error("server error");
  //     }
  //   } catch (e) {
  //     return Future.error(e);
  //   }
}
