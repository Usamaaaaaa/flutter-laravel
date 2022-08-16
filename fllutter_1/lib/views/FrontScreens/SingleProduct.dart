// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  // const SingleProduct({Key key}) : super(key: key);
  final int id;
  final String ProductName;
  final String Productimage;
  final int Productprice;
  final String description;
  final String pcategory;
  final Function onTap;
  SingleProduct({
    Key key,
    this.id,
    this.ProductName,
    this.Productimage,
    this.Productprice,
    this.description,
    this.pcategory,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: HWPM.h200,
              width: 190,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(HWPM.brcircular10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: HWPM.w200,
                      height: HWPM.h130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(Productimage),
                          ),
                          borderRadius:
                              BorderRadius.circular(HWPM.brcircular10)),
                    ),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SafeArea(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 3.0),
                                    child: Text(
                                      ProductName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: HWPM.pt10, top: 5.0),
                                    child: Text(
                                        r"Rs:  " + Productprice.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      // color: Colors.grey,
                                      margin: EdgeInsets.only(
                                          right: HWPM.p15, bottom: HWPM.pt10),
                                      height: HWPM.h30,
                                      width: HWPM.w100 + HWPM.w50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          "BOOK NOW",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                    )
                  ]),
            ),
          ),
          // ider tak
        ],
      ),
    );
  }
}
