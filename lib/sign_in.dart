import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_demo/auth.dart';
import 'package:razorpay_demo/home.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool password = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        Image.asset(
                          'assets/utilities.png',
                          height: 100,
                        ),
                        const Text(
                          'Home Utility Bill Payment',
                          textScaleFactor: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(
                          width: Get.width * 0.7,
                          child: Align(
                            alignment: Alignment.center,
                            child: const Text(
                              'Make hassle-free payment with us',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 4, 25, 93)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: Get.height * 0.05,
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              fillColor: Colors.blue,
                              focusColor: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              fillColor: Colors.blue,
                              focusColor: Colors.blue,
                            ),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {},
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: Get.height * 0.2,
                        ),
                        Text(
                          "Social Login",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SignInButton(
                          Buttons.GoogleDark,
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await AuthService().signWithGoogle();
                            FirebaseAuth.instance
                                .authStateChanges()
                                .listen((User? user) {
                              if (user != null) {
                                Get.to(const MyHomePage());
                              }
                            });

                            setState(() {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          },
                        ),
                        SignInButton(Buttons.Facebook, onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
