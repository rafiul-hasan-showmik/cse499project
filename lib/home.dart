import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:razorpay_demo/user_profile.dart';
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

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home_page';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _razorpay = Razorpay();

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final photo = user?.photoURL;
    final userName = user?.displayName;
    final email = user?.email;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bills'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(UserProfile.routeName,
                    arguments: {
                      'name': userName,
                      'imageLink': photo,
                      'email': email
                    });
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(photo!),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: titlelist.length,
        itemBuilder: (context, index) {
          return ServiceCategory(iconList[index], titlelist[index],
              colorlist[index], routerList[index]);
        },
      ),
    );
  }

  Card billCard(IconData icon, String title, String subtitle, String route) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.red,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right),
        onTap: () => Navigator.of(context).pushNamed(route),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
