import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:razorpay_demo/dataList.dart';
import 'package:razorpay_demo/home.dart';
import 'dataRecord.dart';

class SuccessfullPaymentMobile extends StatelessWidget {
  static const String routeName = '/Successfull_mobile';
  const SuccessfullPaymentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/accept.png',
              height: 150,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Payment Successfull",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Operator: ${route['serviceName']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Phone No: ${route['phone']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Recharge Amount: ${route['amount']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {
                History newData = History(
                    route['serviceName'],
                    route['phone'],
                    route['phone'],
                    route['amount'].toString(),
                    "",
                    "",
                    route['icon'],
                    route['color']);
                hlog.add(newData);
                Navigator.of(context).pushNamed(MyHomePage.routeName);
              },
              child: Text("DONE"),
            ),
          ),
        ],
      ),
    );
  }
}
