// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_interpolation_to_compose_strings

// import 'package:fllutter_1/app_screen/FrontScreens/Profile.dart';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/views/FrontScreens/BottomNavBar.dart';
import 'package:fllutter_1/views/FrontScreens/Myorder.dart';
import 'package:fllutter_1/views/FrontScreens/Profile.dart';
import 'package:fllutter_1/views/FrontScreens/about.dart';
import 'package:fllutter_1/views/FrontScreens/price.dart';
import 'package:fllutter_1/views/FrontScreens/privacypolicy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerPage extends StatefulWidget {
  final String role;
  final String image;
  const DrawerPage({this.role, this.image});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Widget listtile({IconData icon, String title, Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  radius: 45,
                  child: ClipOval(
                    child: Image.network(
                      widget.image.toString(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                    // height: 20,

                    ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome " + widget.role.toUpperCase()),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 30,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(width: 2)),
                          ),
                          onPressed: () {},
                          child: widget.role == 'Guest'
                              ? Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              : Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          listtile(
              icon: Icons.home,
              title: "Home",
              onTap: () {
                Get.to(() => MyStatefulWidget());
              }),
          widget.role == "guest"
              ? listtile(
                  icon: Icons.person,
                  title: "Profile",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyProfile()));
                  },
                )
              : listtile(
                  icon: Icons.person,
                  title: "Price",
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Price()));
                  },
                ),
          listtile(
              icon: Icons.star,
              title: "About us",
              onTap: () {
                Get.to(() => About());
              }),
          listtile(
              icon: Icons.favorite,
              title: "My Orders",
              onTap: () {
                Get.to(() => MyOrder());
              }),
          listtile(
              icon: Icons.format_align_center,
              title: "FAQs",
              onTap: () {
                Get.to(() => PrivacyPolicy());
              }),
          Container(
            padding: EdgeInsets.symmetric(horizontal: HWPM.p15),
            height: HWPM.h200 + HWPM.h150,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Contact Support",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Call us:",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "+923065357684",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Text("Mail us:", style: TextStyle(fontSize: 16)),
                      SizedBox(
                        width: 5,
                      ),
                      Text("senti.777.m@gmail.com",
                          style: TextStyle(fontSize: 16)),
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
