import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:razorpay_demo/history_logs.dart';
import 'package:razorpay_demo/home.dart';
import 'package:razorpay_demo/sign_in.dart';

class UserProfile extends StatefulWidget {
  static final String routeName = "/userProfile";
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 15),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(route['imageLink']),
              ),
            ),
          ),
          Text(
            route['name'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            route['email'],
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                // Foreground color
                onPrimary: Theme.of(context).colorScheme.onPrimary,
                // Background color
                primary: Colors.blue,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(CupertinoIcons.arrow_counterclockwise_circle),
                  title: Text("Payment History"),
                  trailing: Icon(CupertinoIcons.chevron_forward),
                  onTap: () {
                    Navigator.of(context).pushNamed(HistoryLogs.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.book),
                  title: Text("Saved payments"),
                  trailing: Icon(CupertinoIcons.chevron_forward),
                  onTap: () {
                    Navigator.of(context).pushNamed(MyHomePage.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.settings),
                  title: Text("Settings"),
                  trailing: Icon(CupertinoIcons.chevron_forward),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  // Foreground color
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  // Background color
                  primary: Colors.blue,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.toEnd(
                    () => const SignIn(),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
