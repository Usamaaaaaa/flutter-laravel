// ignore_for_file: file_names, library_private_types_in_public_api, avoid_unnecessary_containers, use_build_context_synchronously, unused_local_variable

import 'dart:convert';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/views/FrontScreens/BottomNavBar.dart';
import 'package:fllutter_1/views/FrontScreens/RegisterPage.dart';
import 'package:provider/provider.dart';
// import 'package:fllutter_1/app_screen/StartPage.dart';
import 'package:fllutter_1/models/Login&Register.dart';
import 'package:fllutter_1/models/logincheck.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Signin signin = Signin();

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF363f93),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // SharedPreferences islogin;
  // string for displaying the error Message
  String errorMessage;
  bool ishiddin = true;
  @override
  void initState() {
    super.initState();
    // checkIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return "Please Enter Your Email";
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return "Please Enter a valid Email";
            // return null;
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: ishiddin,
        // ignore: missing_return
        validator: (value) {
          RegExp regex = RegExp(r'^.{5,}$');
          if (value.isEmpty) {
            // return null;
            return ("Password is required for login");
          }
          // if (!regex.hasMatch(value)) {
          //   // return null;
          //   return ("Enter Valid Password(Min. 5 Character)");
          // }
        },
        onSaved: (value) {
          passwordController.text = value;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  ishiddin = !ishiddin;
                });
              },
              child: const Icon(Icons.visibility)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ));

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 0, 10, 5)),
            onPressed: () {
              // passing this to our root
              Navigator.of(context).pop();
            },
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        child: Image.asset(
                          "images/clean.png",
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => ResetPassword()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Text(
                                  "FORGOT PASSWORD ? ",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.amber[800],
                                  ),
                                ),
                              )),
                        ]),
                    SizedBox(height: HWPM.p15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "New User ? ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationScreen()));
                            },
                            child: Text(
                              "REGISTER HERE",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  color: Colors.amber[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ]),
                    SizedBox(height: HWPM.p15),
                    IconButton(
                        onPressed: () {
                          _login();
                        },
                        icon: const Icon(Icons.arrow_forward)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  _login() async {
    try {
      if (_formKey.currentState.validate()) {
        // _login() async
        var data = {
          'email': emailController.text,
          'Password': passwordController.text,
        };
        var res = await Signin().getData(data, 'login');
        var body = json.decode(res.body);
        if (body['success'] == 'true') {
          final itemProvider =
              Provider.of<ItemProvider>(context, listen: false);
          itemProvider.setLogin("true");
          // print(body['user']['email']);
          itemProvider.setRole(body['role']);
          SharedPreferences loginPreference =
              await SharedPreferences.getInstance();
          loginPreference.setString('role', body['role']);
          loginPreference.setString("login", "true");
          loginPreference.setString("email", body['user']['email']);
          loginPreference.setInt("id", body['user']['id']);
          if (body['role'] == "driver" || body['role'] == 'franchise') {
            loginPreference.setString("phone", body['user']['phone']);
          } else {
            loginPreference.setString("phone", body['user']['Phone']);
          }
          // print(body);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyStatefulWidget()));
        } else {
          _showMsg(body['message']);
        }
      }
    } catch (error) {
      _showMsg("something went wrong");
    }
  }
}
