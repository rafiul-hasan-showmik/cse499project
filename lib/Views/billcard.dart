import 'package:flutter/material.dart';

class ServiceCategory extends StatelessWidget {
  IconData icon;
  String title;
  Color color;
  String route;
  //const ServiceCategory({super.key});

  ServiceCategory(this.icon, this.title, this.color, this.route);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: (() {
          changeScreen(context);
        }),
      ),
    );
  }

  void changeScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(route, arguments: {'icon': icon, 'color': color});
  }
}
