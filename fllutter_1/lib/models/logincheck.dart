import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ItemProvider extends ChangeNotifier {
  int temp = 1;
  String _login;
  String get islogin => _login;
  int _total = 0;
  int get totalprice => _total;
  //////////// set total in provider for state management //////////////
  void settotal(int value, int q) {
    if (q < 6) {
      _total = value * q;
    }
    notifyListeners();
  }

  //////////// decrease total in provider for state management //////////////

  void dectotal(int value) {
    if (_total > 0) {
      _total -= value;
    }
    notifyListeners();
  }

  //////////// set login value in provider for state management //////////////
  void setLogin(String value) {
    _login = value;
    // _setPref(value);
    notifyListeners();
  }

  String _role;
  String get role => _role;

  //////////// set role of user in provider for state management //////////////
  void setRole(String role) {
    _role = role;
    notifyListeners();
  }

  // int start = 0;
  // void updatestart(int start) {
  //   this.start = start;
  //   notifyListeners();
  // }

  // void timer() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     updatestart(timer.tick);
  //   });
  // }
}





















// import 'package:shared_preferences/shared_preferences.dart';

//    SharedPreferences islogint;
//  class Login {
//    String islogin;
//    setLogin() async {
//     // islogin = "true";
    
//     islogint = await SharedPreferences.getInstance();
//      islogint.setString('islogin', "true");
//   }

//   checkIsLogin() async {
//     islogint = await SharedPreferences.getInstance();
//     String islog=islogint.getString('islogin');
//     // print(islogint);
//     return islog;
//   }
// }

