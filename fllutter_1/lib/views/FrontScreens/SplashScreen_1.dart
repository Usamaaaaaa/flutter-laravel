// import 'dart:js';

// ignore_for_file: file_names, duplicate_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_const, sort_child_properties_last

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/views/FrontScreens/LoginScreen.dart';
import 'package:fllutter_1/views/FrontScreens/RegisterPage.dart';
import 'package:flutter/material.dart';

class SplashPage1 extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  State<SplashPage1> createState() => _SplashPage1State();
}

class _SplashPage1State extends State<SplashPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
            // actions: [const Icon(Icons.more_vert_outlined)],
            title: const Text("SWD",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0))),
        body: Column(children: [
          Column(children: [
            Container(
              height: HWPM.h150 + HWPM.h150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: Carousel(
                  boxFit: BoxFit.fill,
                  images: [
                    const AssetImage('images/Machine1.jpeg'),
                    const AssetImage('images/Machine2.jpeg'),
                    const AssetImage('images/Machine3.jpeg'),
                    const AssetImage('images/Coats.jpeg'),
                  ],
                  dotSize: 8.0,
                  dotSpacing: 15.0,
                  indicatorBgPadding: 0.1,
                  overlayShadow: true,
                  overlayShadowColors: const Color.fromARGB(255, 104, 98, 98),
                  overlayShadowSize: 0.9),
            ),
          ]),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: HWPM.pt10),
                child: Center(
                    child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(HWPM.p15),
                          child: const Text(
                            "Wide Range Of Services",
                            style: const TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "Specially For Your Garments",
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: HWPM.p15),
                            child: const Text(
                              "Ready to pamper your Garments",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.all(HWPM.pt10),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationScreen()));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(HWPM.bw350, HWPM.bh60),
                                  primary: Colors.greenAccent[600]),
                            )),
                        Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Already have an account? ",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  child: Text(
                                    "Login Here",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        color: Colors.amber[800],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )
                              ])
                        ])
                      ],
                    )),
                  ],
                ))),
          )
        ]));
  }
}
