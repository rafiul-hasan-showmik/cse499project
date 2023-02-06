import 'package:flutter/material.dart';
import 'package:razorpay_demo/paybill.dart';
import 'dataList.dart';

class ElectricityBill extends StatefulWidget {
  static const String routeName = '/electricity_bill';
  const ElectricityBill({super.key});

  @override
  State<ElectricityBill> createState() => _ElectricityBillState();
}

class _ElectricityBillState extends State<ElectricityBill> {
  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(title: Text("Electricity Services")),
        body: ListView.builder(
          itemCount: electricitylist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(electricityImage[index]),
                ),
                title: Text(electricitylist[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: () => {
                  Navigator.of(context)
                      .pushNamed(PayBill.routeName, arguments: {
                    'icon': route['icon'],
                    'color': route['color'],
                    'serviceName': electricitylist[index],
                  })
                },
              ),
            );
          },
        ));
  }
}
