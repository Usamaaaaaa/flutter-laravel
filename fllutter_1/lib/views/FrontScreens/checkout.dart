// ignore_for_file: unused_import, implementation_imports, unnecessary_import, use_key_in_widget_constructors, avoid_print, unnecessary_new, use_build_context_synchronously

import 'dart:convert';

import 'package:fllutter_1/Providers/cartProvider.dart';
import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:fllutter_1/views/FrontScreens/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/insertcart.dart';

class CheckOut extends StatefulWidget {
  final String mode;
  final int id;
  final String total;
  const CheckOut({this.mode, this.id, this.total});
  //  CheckOut({this.mode, Key key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int delivry;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    onCload();
    delivry = 250;
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.mode);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
          color: Colors.black,
        ),
        leadingWidth: 30,
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: HWPM.p20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1.5,
                        color: Colors.blue,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Billing Address',
                                style: TextStyle(
                                    fontSize: HWPM.font20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ///////// name ///////////
                            const Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              child: TextField(
                                controller: nameController,
                                enabled: false,
                                style: TextStyle(
                                    fontSize: HWPM.font20, letterSpacing: 2),
                              ),
                            ),
                            SizedBox(
                              height: HWPM.pt10,
                            ),
                            /////////// phone //////////////////
                            const Text(
                              'Phone',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              child: TextField(
                                controller: phoneController,
                                enabled: false,
                                style: TextStyle(
                                  fontSize: HWPM.font20,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: HWPM.pt10,
                            ),
                            //////////// address /////////
                            const Text(
                              'Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            /////////////// addresss container//////////
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.17,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                controller: addressController,
                                enabled: false,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                minLines: 1,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  // hintText: 'Enter Message',
                                  hintStyle: TextStyle(color: Colors.black87),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: HWPM.pt10,
                    ),
                    //////// deliver charges /////////
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      padding: EdgeInsets.all(HWPM.pt10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Delivery Charges',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '250 Pkr',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: HWPM.pt10,
                    ),
                    //////// total amount ///////
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      padding: EdgeInsets.all(HWPM.pt10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Amount',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            widget.total.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //////////////// confirm order /////////////////
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
                onTap: () async {
                  InsertCart insert = new InsertCart();
                  // print(widget.id);
                  var data = {
                    'userid': widget.id,
                    'total': widget.total,
                    'mode': widget.mode,
                  };
                  // print(data);
                  var res = await insert.postOrder(data, "postorder");
                  // print(res['body']);
                  // List<dynamic> list = res;
                  // print(res.toList());
                  var body = json.decode(res.body);
                  // var provider = Provider;
                  var cart = Provider.of<CartProvider>(context, listen: false);
                  // cart.getData(6);
                  // print(body['success']);
                  cart.setCounter();
                  cart.zeroTotal(0.0);
                  if (body['success'] == 'true') {
                    Future.delayed(
                        const Duration(microseconds: 2), () => {_onSuccess()});
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  height: 45,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'CONFIRM ORDER',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Platform.isIOS
            //     ? const SizedBox(
            //         height: 10,
            //       )
            //     : Container()
          ],
        ),
      ),
    );
  }

///////////////// redirect after confirm order  ////////////////
  Future<bool> _onSuccess() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.grey.shade300,
                // clipBehavior: ,
                title: const Text(
                  "Successfully",
                  style: TextStyle(color: Colors.black),
                ),
                content: const Text(
                  "Thanks!We take your laundery soon ",
                  style: TextStyle(color: Colors.black),
                ),
                // content: Text("Are you sure you want to close App"),
                actions: [
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pop(context, false);
                  //     },
                  //     child: const Text('No Thanks')),
                  ElevatedButton(
                      onPressed: () {
                        Get.off(() => const MyStatefulWidget());
                      },
                      child: const Text(
                        'Ok',
                        style: TextStyle(color: Colors.black),
                      )),
                ]));
  }

  ////////////  get user data  ///////////
  onCload() async {
    InsertCart insert = new InsertCart();

    if (!widget.id.isEqual(null)) {
      var res = await insert.getData(widget.id, 'getuser');

      var body = json.decode(res.body);
      if (body['success'] == 'true') {
        nameController.text = body['user']['name'];
        phoneController.text = body['user']['phone'];
        addressController.text = body['user']['address'];
      }
    }
  }
}
