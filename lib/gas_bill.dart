import 'package:flutter/material.dart';
import 'package:razorpay_demo/paybill.dart';
import 'dataList.dart';

class GasBill extends StatelessWidget {
  static const String routeName = '/gas_bill';
  const GasBill({super.key});

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(title: Text("Gas Services")),
        body: ListView.builder(
          itemCount: gaslist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(gasimage[index]),
                ),
                title: Text(gaslist[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: () =>
                    {Navigator.of(context).pushNamed(PayBill.routeName, arguments: {
                    'icon': route['icon'],
                    'color': route['color'],
                    'serviceName': gaslist[index],
                  })},
              ),
            );
          },
        ));
  }
}
