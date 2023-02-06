import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_demo/InternetBill.dart';
import 'package:razorpay_demo/dataRecord.dart';
import 'package:razorpay_demo/gas_bill.dart';
import 'package:razorpay_demo/history_logs.dart';
import 'package:razorpay_demo/paybill.dart';
import 'package:razorpay_demo/paybillMobile.dart';
import 'package:razorpay_demo/paymentSuccessfull.dart';
import 'package:razorpay_demo/paymentSucessfullMobile.dart';
import 'package:razorpay_demo/phone_recharge.dart';
import 'package:razorpay_demo/service_bill.dart';
import 'package:razorpay_demo/user_profile.dart';
import 'package:razorpay_demo/water_bill.dart';
import 'electricity_bill.dart';
import 'package:razorpay_demo/auth_page.dart';
import 'package:razorpay_demo/home.dart';
import 'package:razorpay_demo/sign_in.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'razor_credentials.dart' as razorCredentials;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home Utilitily Bill Payment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: AuthPage(),
        //home: MyHomePage(),
        routes: {
          '/': (context) => const AuthPage(),
          MyHomePage.routeName: (context) => MyHomePage(),
          ElectricityBill.routeName: (context) => const ElectricityBill(),
          WaterBill.routeName: (context) => WaterBill(),
          GasBill.routeName: (context) => GasBill(),
          InternetBill.routeName: (context) => InternetBill(),
          PhoneRecharge.routeName: (context) => PhoneRecharge(),
          PayBill.routeName: (context) => PayBill(),
          ServiceBill.routeName: (context) => ServiceBill(),
          UserProfile.routeName: (context) => UserProfile(),
          PayBillMobile.routeName: (context) => PayBillMobile(),
          SuccessfullPayment.routeName: (context) => SuccessfullPayment(),
          HistoryLogs.routeName: (context) => HistoryLogs(),
          SuccessfullPaymentMobile.routeName: (context) =>
              SuccessfullPaymentMobile(),
        });
  }
}
