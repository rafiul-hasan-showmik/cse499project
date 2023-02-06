import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razorpay_demo/dataList.dart';

class HistoryLogs extends StatefulWidget {
  static const String routeName = "/history_logs";
  const HistoryLogs({super.key});

  @override
  State<HistoryLogs> createState() => _HistoryLogsState();
}

class _HistoryLogsState extends State<HistoryLogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment History"),
      ),
      body: ListView.builder(
        itemCount: hlog.length - 1,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(
            hlog[index + 1].icon,
            color: hlog[index + 1].color,
          ),
          tileColor: Colors.grey.shade100,
          title: Text(hlog[index + 1].serviceName),
          subtitle: Text(hlog[index + 1].customerID),
          trailing: Text(
            '${hlog[index + 1].amount} BDT',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          onTap: (() => {}),
        ),
      ),
    );
  }
}
