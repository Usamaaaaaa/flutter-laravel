// ignore_for_file: file_names, unnecessary_import, must_be_immutable, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, missing_return, use_build_context_synchronously, sort_child_properties_last
import 'dart:async';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/models/logincheck.dart';
import 'package:fllutter_1/views/FrontScreens/BottomNavBar.dart';
import 'package:fllutter_1/views/FrontScreens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// android:networkSecurityConfig="@xml/network_security_config"
class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);
  // StartPage({Key key}) : super(key: key);
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  SharedPreferences login;
  String email;
  int phone;
  @override
  void initState() {
    GetPreference();
    super.initState();
  }

  // ignore: non_constant_identifier_names
  Future<SharedPreferences> GetPreference() async {
    login = await SharedPreferences.getInstance();
    var em = login.getString("email");
    var ph = login.getInt("Phone");
    setState(() {
      email = em;
      phone = ph;
    });
  }

  @override
  Widget build(BuildContext context) {
    return email != null && phone != null
        ? const MyStatefulWidget()
        : SafeArea(
            child: Scaffold(
                backgroundColor: Colors.grey.shade300,
                body: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: HWPM.pt100),
                        child: Container(
                          height: HWPM.h100,
                          width: HWPM.w100,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(HWPM.brcircular100),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/Swdlogo.jpeg')),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: Center(
                              child: Container(
                        margin: EdgeInsets.only(top: HWPM.pt30),
                        child: Column(children: [
                          Center(
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: HWPM.pt10),
                                child: ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(colors: [
                                      Colors.deepPurple,
                                      Colors.red
                                    ], tileMode: TileMode.mirror)
                                        .createShader(bounds);
                                  },
                                  child: Text("EST.2005",
                                      style: TextStyle(
                                        letterSpacing: 8.0,
                                        fontFamily: 'DancingScript',
                                        fontSize: HWPM.font30,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: HWPM.pt10),
                                child: ShaderMask(
                                  blendMode: BlendMode.srcOut,
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(colors: [
                                      Colors.deepPurple,
                                      Colors.red
                                    ], tileMode: TileMode.mirror)
                                        .createShader(bounds);
                                  },
                                  child: Text("SNOWHITE",
                                      style: TextStyle(
                                          letterSpacing: 16.0,
                                          fontFamily: 'DancingScript',
                                          fontSize: HWPM.font40)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: HWPM.pt10),
                                child: ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(colors: [
                                      Colors.deepPurple,
                                      Colors.red
                                    ], tileMode: TileMode.mirror)
                                        .createShader(bounds);
                                  },
                                  child: Text("DRYCLEANERS",
                                      style: TextStyle(
                                          letterSpacing: 8.0,
                                          fontFamily: 'DancingScript',
                                          fontSize: HWPM.font30)),
                                ),
                              ),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: HWPM.m20, bottom: HWPM.m10),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final itemProvider =
                                        Provider.of<ItemProvider>(context,
                                            listen: false);

                                    SharedPreferences sh =
                                        await SharedPreferences.getInstance();
                                    itemProvider.setLogin("false");
                                    itemProvider.setRole("guest"); //guest
                                    sh.setString("role", "guest"); //guest
                                    sh.setString("login", "false");

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyStatefulWidget()));
                                  },
                                  child: Text('Get Started',
                                      style: TextStyle(
                                          fontSize: HWPM.font20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(HWPM.bw350, HWPM.bh60),
                                      primary: Colors.indigoAccent),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(HWPM.bw350, HWPM.bh60),
                                  primary: Colors.amber[800]),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: HWPM.font20, color: Colors.black),
                              ),
                            )),
                          ),
                        ]),
                      ))),
                    )
                  ],
                )),
          );
  }
}
