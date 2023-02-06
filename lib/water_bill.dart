import 'package:flutter/material.dart';
import 'package:razorpay_demo/paybill.dart';
import 'dataList.dart';

class WaterBill extends StatelessWidget {
  static const String routeName = '/water_bill';
  const WaterBill({super.key});

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(title: Text("Water Services")),
        body: ListView.builder(
          itemCount: waterlist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(waterimage[index]),
                ),
                title: Text(waterlist[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: () =>
                    {Navigator.of(context).pushNamed(PayBill.routeName, arguments: {
                    'icon': route['icon'],
                    'color': route['color'],
                    'serviceName': waterlist[index],
                  })},
              ),
            );
          },
        ));
  }
}
