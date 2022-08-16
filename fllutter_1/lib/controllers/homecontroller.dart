// ignore_for_file: file_names

import 'package:http/http.dart' as http;

class Home {
  // working fo emulator
  String baseUrl = "http://10.0.2.2:8000/api/";
  // formobile
  // String baseUrl = "http://192.168.73.142:8000/api/";

  /////////////// get data from database through Api//////////
  getData(url) async {
    var fullUrl = baseUrl + url;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  /////////// set header of for http request ///////////
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  // postData(data,url) async {
  //   var fullUrl = baseUrl+url;
  //   return await http.post(
  //       Uri.parse(fullUrl),
  //       body: jsonEncode(data),
  //       headers: _setHeaders()
  //   );
  // }
}
