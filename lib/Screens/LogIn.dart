import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:api_app/Screens/HomePage.dart';
import 'package:api_app/Screens/SignUp.dart';
import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'HomePage.dart';
import 'SignUp.dart';

class LogIN extends StatefulWidget {
  @override
  _LogINState createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  String message;
  var res;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accesstoken":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFwaS13ZWItMjQiLCJpYXQiOjE2MTcwNzgzOTh9.Nu2TRql1dN09KEKWiQvdIsWWTaVAbEcuhT_GwMHr13I",
  };

  login() async {
    res = await http.post(
      Uri.parse("https://api-dev-24.herokuapp.com/api/user/signin"),
      body: jsonEncode({
        "email": _emailController.text,
        "password": _passController.text,
      }),
      headers: headers,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
    print(res.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    message = res.toString();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 30.0,
                        bottom: 70.0,
                      ),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    CustomInput(
                      controller: _emailController,
                      hintText: "Email",
                      obsecureText: false,
                    ),
                    // TextField(
                    //   obscureText: true,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Password',
                    //   ),
                    // ),
                    CustomInput(
                      controller: _passController,
                      hintText: "Password",
                      obsecureText: true,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: custom_btn(
                        text: "Log In",
                        outline: false,
                        onpressed: () {
                          if (_emailController.text.isEmpty ||
                              _passController.text.isEmpty) {
                            //print("Fields are Empty");
                            return "Fields are Empty";
                          }
                          if (message == "Invalid email address") {
                            return "Email or Password Incorrect";
                          } else if (_emailController.text.isNotEmpty &&
                              _passController.text.isEmpty) {
                            print("Enter the Password");
                          } else if (_emailController.text.isEmpty &&
                              _passController.text.isNotEmpty) {
                            print("Enter the Email");
                          } else {
                            login();
                          }
                        },
                      ),
                    ),
                    // Container(
                    //     padding: EdgeInsets.only(
                    //       top: 20.0,
                    //       bottom: 20.0,
                    //     ),
                    //     child:
                    //     Text("Forgot Password?")),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                            top: 10.0,
                            bottom: 40.0,
                          ),
                          child: Text("New to Covid-19 Tracker?")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
