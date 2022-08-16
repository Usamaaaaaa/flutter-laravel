// ignore_for_file: unnecessary_import, implementation_imports, use_build_context_synchronously, use_key_in_widget_constructors, avoid_print, await_only_futures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:st_pay/services/payment.dart';
import 'package:fllutter_1/services/payment.dart';
import 'package:progress_dialog/progress_dialog.dart';

class HomeStripe extends StatefulWidget {
  // const Home({required Key key}) : super(key: key);

  // const Home({super.key});

  @override
  State<HomeStripe> createState() => _HomeStripeState();
}

class _HomeStripeState extends State<HomeStripe> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    StripeService.init();
  }

  void payWithCard(int amount) async {
    // StripeService.creatPaymentIntent("5", "USD");
    ProgressDialog dialog = ProgressDialog(context);
    await dialog.style(message: 'please wait');
    await dialog.show();
    var res = await StripeService.payWithNewCard(
        amount: amount.toString(), currency: 'USD');
    await dialog.hide();
    // Scaffold.of(context).showSnackBar()
    print(res.msg);

    _showMyDialog(res.msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CupertinoButton(
              child: const Text('pay'),
              onPressed: () async {
                print('hh');
                // payWithCard(amo);
                int amount = 5 * 100;
                // int intamount = (amount / 10).ceil();
                payWithCard(amount);
              })
        ],
      ),
    );
  }

  Future<void> _showMyDialog(msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(msg.toString()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
