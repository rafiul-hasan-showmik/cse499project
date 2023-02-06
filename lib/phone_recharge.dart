import 'package:flutter/material.dart';
import 'package:razorpay_demo/paybillMobile.dart';
import 'dataList.dart';

class PhoneRecharge extends StatelessWidget {
  static const String routeName = '/phone_recharge';
  const PhoneRecharge({super.key});

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(title: Text("Mobile Operators")),
        body: ListView.builder(
          itemCount: telephonelist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(telephoneimage[index]),
                ),
                title: Text(telephonelist[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: () =>
                    {Navigator.of(context).pushNamed(PayBillMobile.routeName, arguments: {
                    'icon': route['icon'],
                    'color': route['color'],
                    'serviceName': telephonelist[index],
                  })},
              ),
            );
          },
        ));
  }
}
