// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, duplicate_import

import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/controllers/homecontroller.dart';
import 'package:fllutter_1/models/logincheck.dart';
import 'package:fllutter_1/views/FrontScreens/Location.dart';
import 'package:fllutter_1/views/FrontScreens/Myorder.dart';
import 'package:fllutter_1/views/FrontScreens/Profile.dart';
import 'package:fllutter_1/views/FrontScreens/SplashScreen_1.dart';
import 'package:fllutter_1/views/FrontScreens/about.dart';
import 'package:fllutter_1/views/FrontScreens/membership.dart';
import 'package:fllutter_1/views/FrontScreens/price.dart';
import 'package:fllutter_1/views/FrontScreens/privacypolicy.dart';
import 'package:fllutter_1/views/FrontScreens/term&condition.dart';
import 'package:fllutter_1/views/StartPage.dart';
import 'package:fllutter_1/views/FrontScreens/about.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // String val;
  var p;
  @override
  void initState() {
    p = Provider.of<ItemProvider>(context, listen: false);
    super.initState();
  }

  ///////////////// setting List func //////////////
  Widget SettingTile({IconData icon, String title, Function onTap}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }

  ///////////////// Logout func //////////////
  Future<bool> _Logout() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.grey.shade300,
                title: const Text("Logout"),
                content: const Text(
                  "Sure ! You want to Logout ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('No')),
                  ElevatedButton(
                      onPressed: () async {
                        p.setLogin("false");
                        p.setRole("");
                        SharedPreferences sh =
                            await SharedPreferences.getInstance();
                        sh.remove("email");
                        sh.remove("phone");
                        sh.remove("id");
                        sh.remove("role");
                        sh.setString("login", "false");
                        Get.offAll(() => const StartPage());
                      },
                      child: const Text('Yes')),
                ]));
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    p = Provider.of<ItemProvider>(context, listen: false);

    if (p.islogin == 'false') {
      return SplashPage1();
    } else if (p.islogin == "true") {
      // print(val);
      return Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            title: const Text("Setting"),
          ),
          body: ListView(
            children: [
              Container(
                // padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(HWPM.p15),
                height: HWPM.h150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('images/clean.png')),
                  // borderRadius: BorderRadius.circular(50)
                ),

                // color: Colors.white,
              ),
              ///////////////// MyOrders //////////////
              p.role == 'user'
                  ? SettingTile(
                      icon: Icons.shop_outlined,
                      title: "My Orders",
                      onTap: () {
                        Get.to(() => const MyOrder());
                      })
                  : SettingTile(
                      icon: Icons.home,
                      title: "Home",
                      onTap: () {
                        Get.to(() => Home());
                      }),

              ///////////////// delivry address //////////////
              p.role == 'franchise' || p.role == 'admin' || p.role == 'driver'
                  ? SettingTile(
                      icon: Icons.map,
                      title: "Live Location",
                      onTap: () {
                        return Get.to(() => const Mylocation());
                      })
                  : SettingTile(
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address",
                      onTap: () {
                        Get.to(() => const MyProfile());
                      }),

              ///////////////// Membership //////////////
              p.role == 'driver'
                  ? const Divider(
                      thickness: 2,
                    )
                  : p.role == 'franchise' || p.role == 'admin'
                      ? SettingTile(
                          icon: Icons.payment,
                          title: "Prices",
                          onTap: () {
                            return Get.to(() => const Price());
                          })
                      : SettingTile(
                          icon: Icons.person_outline,
                          title: "Membership",
                          onTap: () {
                            return Get.to(() => const MemberShip());
                          }),

              ///////////////// terms //////////////
              SettingTile(
                  icon: Icons.file_copy_outlined,
                  title: "Terms & Conditions",
                  onTap: () {
                    return Get.to(() => const TermCondition());
                  }),

              ///////////////// Policy //////////////
              SettingTile(
                  icon: Icons.policy_outlined,
                  title: "Privacy Policy",
                  onTap: () {
                    return Get.to(() => const PrivacyPolicy());
                  }),
              ///////////////// about //////////////
              SettingTile(
                  icon: Icons.add_chart,
                  title: "About",
                  onTap: () {
                    return Get.to(() => const About());
                  }),

              ///////////////// Logout //////////////
              SettingTile(
                  icon: Icons.exit_to_app_outlined,
                  title: "Log Out",
                  onTap: () async {
                    _Logout();
                  }),
            ],
          ));
    }
  }
}
