// import 'dart:js';

// ignore_for_file: unused_import, await_only_futures, unnecessary_new, unused_local_variable

import 'dart:convert';

import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/services/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/insertcart.dart';

class MemberShip extends StatefulWidget {
  const MemberShip({Key key}) : super(key: key);

  @override
  State<MemberShip> createState() => _MemberShipState();
}

class _MemberShipState extends State<MemberShip> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    StripeService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _showMsg(msg) {
      //
      final snackBar = SnackBar(
        backgroundColor: const Color(0xFF363f93),
        content: Text(
          msg,
          style: TextStyle(color: Colors.white, fontSize: HWPM.font20),
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

    void payWithCard(int amount) async {
      var res = await StripeService.payWithNewCard(
          amount: amount.toString(), currency: 'usd');
      SharedPreferences pf = await SharedPreferences.getInstance();
      int id = await pf.getInt('id');

      if (res.success == true) {
        InsertCart insert = new InsertCart();
        // print(widget.id);
        var data = {
          'userid': id,
          'membership': "member",
        };
        // var res = await insert.postOrder(data, "memberstatus");

        // var body = json.decode(res.body);

        _showMsg(res.msg);
      } else {
        _showMsg(res.msg);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.all(HWPM.p15),
        child: const Text('Member Ship'),
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(HWPM.p20),
              child: Text(
                'MemberShip Detail',
                style: TextStyle(
                    fontSize: HWPM.font30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.p15),
              child: Text(
                'Get Snowhite membership card in Rs 1200 for one year and get 40% discount on all services for one year.',
                style: TextStyle(fontSize: HWPM.font20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt40),
              child: const Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.all(HWPM.pt10),
                  child: CupertinoButton.filled(
                    onPressed: () {
                      payWithCard(1200 * 100);
                    },
                    child: const Text(r'Get Membership'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
