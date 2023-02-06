import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:razorpay_demo/paybill.dart';
import 'dataList.dart';

class InternetBill extends StatelessWidget {
  static const String routeName = '/internet_bill';
  const InternetBill({super.key});

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(title: Text("Internet Services")),
        body: ListView.builder(
          itemCount: internetlist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent, 
                  backgroundImage: NetworkImage(internetimage[index]),
                ),
                title: Text(internetlist[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: () =>
                    {Navigator.of(context).pushNamed(PayBill.routeName, arguments: {
                    'icon': route['icon'],
                    'color': route['color'],
                    'serviceName': internetlist[index],
                  })},
              ),
            );
          },
        ));
  }
}
