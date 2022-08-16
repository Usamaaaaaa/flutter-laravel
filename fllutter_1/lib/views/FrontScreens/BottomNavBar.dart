// ignore_for_file: file_names, unused_import, unused_local_variable, non_constant_identifier_names, await_only_futures, avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:fllutter_1/views/FrontScreens/HomePage.dart';
import 'package:fllutter_1/views/FrontScreens/Profile.dart';
import 'package:fllutter_1/views/FrontScreens/Services.dart';
import 'package:fllutter_1/views/FrontScreens/Setting.dart';
import 'package:fllutter_1/views/FrontScreens/SplashScreen_1.dart';
import 'package:fllutter_1/views/FrontScreens/price.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fllutter_1/models/logincheck.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var pages = [
    const HomePage(),
    const Service(),
    MyProfile(),
    const SettingPage(),
  ];
  int _selectedIndex = 0;
  String role = "";
  bool isloading = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    Log();
    super.initState();

    var itemP = Provider.of<ItemProvider>(context, listen: false);
  }

  Log() async {
    setState(() {
      isloading = true;
    });
    var log = Provider.of<ItemProvider>(context, listen: false);
    SharedPreferences pre = await SharedPreferences.getInstance();
    role = await pre.getString("role");

    String v = pre.getString('login');
    log.setLogin(v);
    log.setRole(role);
    setState(() {
      isloading = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(role);

    return isloading
        // ignore: prefer_const_constructors
        ? Scaffold(
            // ignore: prefer_const_constructors
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            body: Center(
              child: pages[_selectedIndex],
            ),

            // bottomNavigationBar:
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.white,
              unselectedItemColor:
                  const Color.fromARGB(220, 10, 1, 1).withOpacity(.70),
              selectedFontSize: 18,
              unselectedFontSize: 16,

              items: <BottomNavigationBarItem>[
                /////////  home tab /////
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                /////////  services tab /////
                const BottomNavigationBarItem(
                  icon: Icon(Icons.post_add),
                  label: 'Services',
                ),
                /////////  profile && price tab /////
                role == "user"
                    ? BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "Profile",
                      )
                    : role == "guest"
                        ? const BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: "Price",
                          )
                        : const BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: "Location",
                          ),
                /////////  others tab /////
                const BottomNavigationBarItem(
                  icon: Icon(Icons.settings_applications),
                  label: 'Others',
                ),
              ],
              currentIndex: _selectedIndex,
              // selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          );
  }
}
