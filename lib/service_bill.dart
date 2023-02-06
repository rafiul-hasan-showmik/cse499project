import 'package:flutter/material.dart';
import 'package:razorpay_demo/paybill.dart';
import 'dataList.dart';

class ServiceBill extends StatelessWidget {
  
  static const String routeName = '/service_bill';
  
  const ServiceBill({super.key});

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(title: Text("Services List")),
        body: ListView.builder(
          itemCount: servicechargelist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(servicechargeimage[index]),
                ),
                title: Text(servicechargelist[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: () => {
                  Navigator.of(context)
                      .pushNamed(PayBill.routeName, arguments: {
                    'icon': route['icon'],
                    'color': route['color'],
                    'serviceName': servicechargelist[index],
                  })
                },
              ),
            );
          },
        ));
  }
}
