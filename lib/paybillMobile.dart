import 'package:flutter/material.dart';
import 'package:razorpay_demo/dataList.dart';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:razorpay_demo/paymentSuccessfull.dart';
import 'package:razorpay_demo/paymentSucessfullMobile.dart';
import 'Views/billcard.dart';
import 'dataList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_demo/home.dart';
import 'electricity_bill.dart';
import 'package:razorpay_demo/sign_in.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'razor_credentials.dart' as razorCredentials;

class PayBillMobile extends StatefulWidget {
  static const String routeName = "/pay_bill_mobille";

  const PayBillMobile({super.key});

  @override
  State<PayBillMobile> createState() => _PayBillMobileState();
}

class _PayBillMobileState extends State<PayBillMobile> {
  String dropdownvalue = 'January';
  String downdownYear = '2018';
  double _rAmount = 1;
  String _phoneNo = "";
  bool _check = false;
  IconData icon = Icons.abc;
  Color color = Colors.black;
  String serviceName = "";
  TextEditingController _amountCollect = TextEditingController();
  TextEditingController _phoneCollect = TextEditingController();

  final _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);
    // Do something when payment fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message ?? ''),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.walletName ?? ''),
      ),
    );
  }

// create order
  void createOrder() async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": 100 * _rAmount,
      "currency": "USD",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
      _check = true;
    }

    if (_check == true) {
      Navigator.of(context)
          .pushNamed(SuccessfullPaymentMobile.routeName, arguments: {
        'amount': _rAmount,
        'phone': _phoneNo,
        'icon': icon,
        'color': color,
        'serviceName': serviceName,
      });
    }
    print(res.body);
  }

  openGateway(String orderId) {
    var options = {
      'key': razorCredentials.keyId,
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'HUBPS',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'BILL',
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '9123456789',
        'email': 'ary@example.com',
      }
    };
    _razorpay.open(options);
  }

  verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "razorpay_signature_verify.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.body),
        ),
      );
    }
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    color = route['color'];
    icon = route['icon'];
    serviceName = route['serviceName'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Recharge"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _phoneCollect,
              decoration: InputDecoration(
                labelText: 'Phone No.',
                border: OutlineInputBorder(),
                fillColor: Colors.blue,
                focusColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _amountCollect,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
                fillColor: Colors.blue,
                focusColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  _rAmount = double.parse(_amountCollect.text.toString());
                  _phoneNo = _phoneCollect.text.toString();
                  createOrder();
                },
                child: Text("Proceed To Pay"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
