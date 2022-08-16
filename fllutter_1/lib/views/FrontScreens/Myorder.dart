// ignore_for_file: file_names, avoid_print, duplicate_ignore, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/HWPM.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  int id;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    order();
    super.initState();
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
  // get all order of user
  Future<List<dynamic>> order() async {
    // print("order");
    SharedPreferences sh = await SharedPreferences.getInstance();
    id = sh.getInt('id');
    var data = {'id': id};

    List<dynamic> list = [];
// for mobile
    // String baseUrl = "http://192.168.10.14:8000/api/userorder";
    // for emulator
    String baseUrl = "http://10.0.2.2:8000/api/userorder";
    var res = await http.post(Uri.parse(baseUrl),
        body: jsonEncode(data), headers: _setHeaders());

    var dat = json.decode(res.body);
    // print(dat);
    for (var order in dat) {
      list.add(order);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: order(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                // print(snapshot.data);
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    return Expanded(
                        child: ListView.builder(
                            // ignore: avoid_print
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              print(snapshot.data.length);
                              return Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        snapshot.data[index]['image'] != null
                                            ? Image(
                                                height: HWPM.h100,
                                                width: HWPM.w100,
                                                image: NetworkImage(snapshot
                                                    .data[index]['image']
                                                    .toString()))
                                            : const Image(
                                                image: AssetImage(
                                                    'images/empty.jpg')),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        snapshot.data[index]
                                                                ['name']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      snapshot.data[index]
                                                                  ['state'] ==
                                                              'pending'
                                                          ? Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right: HWPM
                                                                          .p15),
                                                              child: Text('Status :' +
                                                                  snapshot.data[
                                                                          index]
                                                                          [
                                                                          'state']
                                                                      .toString()),
                                                            )
                                                          : const Text('')
                                                    ],
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(r"$ " +
                                                  snapshot.data[index]['price']
                                                      .toString()),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Category : " +
                                                    snapshot.data[index]
                                                            ['category']
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }));
                  } else {
                    return Center(child: Image.asset('images/empty.webp'));
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
