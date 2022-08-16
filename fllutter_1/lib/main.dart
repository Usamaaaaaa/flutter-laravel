// ignore_for_file: use_key_in_widget_constructors, unused_import, avoid_print

import 'dart:async';
import 'package:fllutter_1/Providers/ProductProvider.dart';
import 'package:fllutter_1/controllers/homecontroller.dart';
import 'package:fllutter_1/models/logincheck.dart';
import 'package:fllutter_1/views/FrontScreens/BottomNavBar.dart';
import 'package:fllutter_1/views/StartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fllutter_1/home.dart';
import 'Providers/cartProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = "";
  ///////////// set and get data in cache using shared preferences///////////
  SharedPreferences p = await SharedPreferences.getInstance();
  String val = p.getString('login');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ItemProvider())),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: GetMaterialApp(
          title: "SWD",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.grey.shade300),
          home: MyApp(
            l: val,
          )),
    ),
  );
}

class MyApp extends StatefulWidget {
  final String l;
  const MyApp({this.l});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ItemProvider pro;
  @override
  ///////////////// this function call one time when page open ///////////
  void initState() {
    pro = Provider.of<ItemProvider>(context, listen: false);
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  onload() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    String log = p.getString('login');
    pro.setLogin(log);
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (widget.l == "false" || widget.l == null) {
      return const StartPage();
    } else if (widget.l == "true") {
      return const MyStatefulWidget();
    }
  }
}
