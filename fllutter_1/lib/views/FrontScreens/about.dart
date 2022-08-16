// ignore_for_file: implementation_imports

import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          title: const Padding(
        padding: EdgeInsets.all(15),
        child: Text('About Us'),
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: Text(
                'About Us',
                style: TextStyle(
                    fontSize: HWPM.font30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.p15),
              child: const Text(
                'Snowhite established in 1949 is a pioneer dry cleaning organization.A long and consistent pursuit of excellence backed by high professionalism in dry cleaning standards has accorded growth in Snowhite’s operations. From just a single shop in Karachi’s Abdullah Haroon Road, Snowhite now boasts of 16 branches in Karachi alone, 7 branches in Rawalpindi, and 6 branches in Islamabad. We have the largest network of cleaning services in the country. This third-generation business enjoys the undisputed confidence of growing clientele all over Pakistan. We are not the only  pioneer in dry cleaning and laundry services but we are also the first in Pakistan to introduce on spot carpet and upholstery cleaning, the first in providing the professional cleaning of draperies blinds at your door step',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: HWPM.p15),
              height: HWPM.h200 + HWPM.h150,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Contact Support",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
