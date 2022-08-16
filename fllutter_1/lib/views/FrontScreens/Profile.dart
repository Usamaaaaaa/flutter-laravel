// import 'dart:js';

// ignore_for_file: file_names, unused_import, prefer_typing_uninitialized_variables, await_only_futures

import 'dart:convert';

import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/controllers/profilecontroller.dart';
import 'package:fllutter_1/main.dart';
import 'package:fllutter_1/views/FrontScreens/DrawerPage.dart';
import 'package:fllutter_1/views/FrontScreens/Location.dart';
import 'package:fllutter_1/views/FrontScreens/Myorder.dart';
import 'package:fllutter_1/views/FrontScreens/SplashScreen_1.dart';
import 'package:fllutter_1/views/FrontScreens/about.dart';
import 'package:fllutter_1/views/FrontScreens/membership.dart';
import 'package:fllutter_1/views/FrontScreens/price.dart';
import 'package:fllutter_1/views/FrontScreens/privacypolicy.dart';
import 'package:fllutter_1/views/FrontScreens/profile_detail.dart';
import 'package:fllutter_1/views/FrontScreens/term&condition.dart';
import 'package:fllutter_1/views/StartPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/insertcart.dart';
import '../../models/logincheck.dart';
import '../../models/profileModel.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var data;

  bool isloading = false;
  @override
  void initState() {
    onload();
    super.initState();
  }

  Widget listTile({IconData icon, String title, Function onTap}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }

  // const MyProfile({ Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<ItemProvider>(context, listen: false);
    if (p.role == "guest") {
      return const Price();
      // return Mylocation();
    } else if (p.role != "user") {
      return const Mylocation();
    } else {
      return isloading
          ? Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: const Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              backgroundColor: Colors.lightBlue[900],
              drawer: DrawerPage(
                role: data['Firstname'],
                image: data['image'],
              ),
              appBar: AppBar(
                // backgroundColor: Colors.grey.shade300,
                elevation: 0,
                // backgroundColor: Colors.transparent,
                title: const Text(
                  "MY Profile",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              body: Stack(children: [
                Column(
                  children: [
                    Container(
                      height: HWPM.h100, //0.15
                      color: Colors.lightBlue[900],
                    ),
                    Expanded(
                      child: Container(
                        height: HWPM.h400, //0.6
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: HWPM.p15, vertical: HWPM.pv10),
                        decoration: BoxDecoration(
                          // color: Colors.cyan,
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(HWPM.pt30),
                            topRight: Radius.circular(HWPM.pt30),
                          ),
                        ),

                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: HWPM.w200, //0.5
                                  height: HWPM.h80,
                                  padding: EdgeInsets.only(left: HWPM.p20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['Firstname'].toString(),
                                            style: TextStyle(
                                                fontSize: HWPM.p15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: HWPM.pt10,
                                          ),
                                          Text(data['email'].toString()),
                                        ],
                                      ),
                                      // edit profile
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() {
                                            return ProfileDetailScreen(
                                              id: data['id'],
                                              fname: data['Firstname'],
                                              lname: data['Lastname'],
                                              email: data['email'],
                                              phone: data['Phone'],
                                              address: data['Address'],
                                              image: data['image'],
                                            );
                                          });
                                        },
                                        child: const CircleAvatar(
                                          radius: 15,
                                          // backgroundColor: Colors.black,
                                          child: CircleAvatar(
                                            radius: 12,
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.black,
                                            ),
                                            // backgroundColor:
                                            // Colors.lightBlue[900],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            listTile(
                                icon: Icons.shop_outlined,
                                title: "My Orders",
                                onTap: () {
                                  Get.to(() => const MyOrder());
                                }),
                            listTile(
                                icon: Icons.location_on_outlined,
                                title: "My Delivery Address",
                                onTap: () {
                                  Get.to(() => ProfileCurd());
                                }),
                            listTile(
                                icon: Icons.person_outline,
                                title: "Membership",
                                onTap: () {
                                  Get.to(() => const MemberShip());
                                }),
                            listTile(
                                icon: Icons.file_copy_outlined,
                                title: "Terms & Conditions",
                                onTap: () {
                                  Get.to(() => const TermCondition());
                                }),
                            listTile(
                              icon: Icons.policy_outlined,
                              title: "Privacy Policy",
                              onTap: () {
                                Get.to(() => const PrivacyPolicy());
                              },
                            ),
                            listTile(
                                icon: Icons.add_chart,
                                title: "About",
                                onTap: () {
                                  Get.to(() => const About());
                                }),
                            // listTile(
                            //     icon: Icons.exit_to_app_outlined,
                            //     title: "Log Out",
                            //     onTap: () {
                            //       Navigator.of(context).push(MaterialPageRoute(
                            //           builder: (context) => const StartPage()));
                            //     }),
                          ],
                        ),
                      ),
                    ),

                    //  ye
                  ],
                ),
                // ),
                // image code
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: CircleAvatar(
                    radius: 50,
                    //  height: 150,
                    // backgroundColor: Colors.black,
                    child:
                        // data['image']==null?
                        Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: data['image'] != null
                              ? NetworkImage(data['image'].toString())
                              : const AssetImage('images/noimage.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                )
              ]));
    }
  }

  onload() async {
    isloading = true;
    SharedPreferences pre = await SharedPreferences.getInstance();
    int id = await pre.getInt("id");
    if (!id.isEqual(null)) {
      // print(id);

      var res = await InsertCart().getData(id, 'getprofile');
      // print(res.body);
      var bod = json.decode(res.body);
      data = bod;
      setState(() {
        isloading = false;
      });
      // print(data);
    }
  }
}
