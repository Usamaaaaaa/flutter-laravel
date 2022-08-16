import 'package:fllutter_1/Widgets/HWPM.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.all(HWPM.p15),
        child: const Text('Privacy Policy'),
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(HWPM.p15),
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                    fontSize: HWPM.font30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(HWPM.p15),
              child: const Text(
                'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Personal Data: \n\nWhile using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n\n ⚫ Email address \n ⚫ First name and last name \n ⚫ Phone number \n ⚫ Address, City',
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
            Text(
              'Contact Us',
              style:
                  TextStyle(fontSize: HWPM.font30, fontWeight: FontWeight.bold),
            ),
            const Text(
                ' If you have any questions about this Privacy Policy, You can contact us: /n By phone number: 03215278367')
          ],
        ),
      ),
    );
  }
}
