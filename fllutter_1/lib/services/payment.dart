// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String msg;
  bool success;
  StripeTransactionResponse({this.msg, this.success});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiurl = '${StripeService.apiBase}/payment_intents';
  static Uri paymentApiuri = Uri.parse(paymentApiurl);
  static String secret =
      'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-type': 'application/x-www-form-urlencoded'
  };
  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
        merchantId: "Test",
        androidPayMode: 'test'));
  }

// Future<Map<String, dynamic>?>

  static Future<StripeTransactionResponse> payWithNewCard(
      {String currency, String amount}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      var paymentIntent =
          await StripeService.createPaymentIntent(amount, currency);
      // var paymentIntent = StripePayment.createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent["client_secret"],
          paymentMethodId: paymentMethod.id));
      if (response.status == 'succeeded') {
        return StripeTransactionResponse(
            msg: "Transaction Successful", success: true);
      } else {
        return StripeTransactionResponse(
            msg: "Transaction Fail", success: false);
      }
    } on PlatformException catch (error) {
      return StripeService.getPlatformExceptionErrorResult(error);
    } catch (error) {
      return StripeTransactionResponse(
          msg: "Transaction Fail$error", success: false);
    }
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "amount": amount,
        "currency": currency,
        'payment_method_types[]': 'card'
      };
      var response =
          await http.post(paymentApiuri, headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (error) {
      print(error);
    }
    return null;
  }

  static getPlatformExceptionErrorResult(err) {
    print(err);
    String message = 'Something went Wrong';
    if (err.code == 'cancelled') {
      message = "Transaction Cancel";
    }
    return StripeTransactionResponse(msg: message, success: false);
  }
}
// StripeService.creatp 
//  var stripePaymentMethod = await StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest());
        // var stripePaymentIntent = await StripeService.createPaymentIntent(amount, currency);
      