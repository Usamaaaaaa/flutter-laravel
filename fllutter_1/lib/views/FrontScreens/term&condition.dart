// ignore_for_file: file_names

import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:flutter/material.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.all(HWPM.p15),
        child: const Text('Term & Condition'),
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(HWPM.p15),
              child: Text(
                'Term & Condition',
                style: TextStyle(
                    fontSize: HWPM.font30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.p15),
              child: const Text(
                'The services provided by Snow White dry Cleaner are subject to your compliance with and acceptance of the terms and conditions set forth below. Your use of Snow White Cleaner services (“Services”) indicates your agreement to be bound by the terms and conditions contained herein.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: Text(
                'Payment:',
                style: TextStyle(
                    fontSize: HWPM.font20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: const Text(
                'The customer must complete payment of the agreed upon charges on or before the completion of the Services. All payments are non-refundable.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: Text(
                'Inventory:',
                style: TextStyle(
                    fontSize: HWPM.font20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: const Text(
                'Snow White dry Cleaner is not responsible for any items not listed on the Collection Slip. The Customer agrees to be bound by the content of the Collection Slip.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: Text(
                'Loss or Damage:',
                style: TextStyle(
                    fontSize: HWPM.font20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: const Text(
                'Missing or damaged items must be reported to Snow White dry Cleaner within 24 hours of delivery of your garments/linen. Failure to report the missing or damaged item within 24 hours shall remove any liability of Snow White dry Cleaner for the missing or damaged item. In the event that any item is lost or damaged by Snow White dry Cleaner, Snow White dry Cleaner’s liability with respect to any damaged or lost items shall not exceed ten (10) times our charge for cleaning that garment regardless of brand or condition. Snow White dry Cleaner is not liable for any preexisting damage to a garment or other item and reserves the right to return any item without cleaning it if any preexisting damage is found or if we have a concern about the colorfastness or the age or weakness of the fabric.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: Text(
                'Uncollected Items:',
                style: TextStyle(
                    fontSize: HWPM.font20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: const Text(
                'Snow White dry Cleaner reserves the right to dispose of any items not collected within 120 days of the date stated on the collection slip. Snow White dry Cleaner shall have no liability whatsoever in respect of items disposed of pursuant to this clause.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: const Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: Text(
                'Legal Policy:',
                style: TextStyle(
                    fontSize: HWPM.font20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.pt10),
              child: const Text(
                'Thank you for your custom. We cannot accept responsibility for belts, buckles, beads and zips. Items not collected within 3 months will be disposed of.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
