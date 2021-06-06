import 'dart:convert';
import 'package:api_app/Screens/LogIn.dart';
import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:api_app/Screens/LogIn.dart';
import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:geolocator/geolocator.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String email;

  final TextEditingController _uEmailController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  var _latitude = "";
  var _longitude = "";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accesstoken":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFwaS13ZWItMjQiLCJpYXQiOjE2MTcwNzgzOTh9.Nu2TRql1dN09KEKWiQvdIsWWTaVAbEcuhT_GwMHr13I",
  };
  updateData() async {
    final res = await http.put(
      Uri.parse("https://api-dev-24.herokuapp.com/api/user/update/$email"),
      body: jsonEncode({
        "nic": _nicController.text,
        "firstName": _fNameController.text,
        "lastName": _lNameController.text,
        "birthday": _birthController.text,
        "mobile": _mobileController.text,
        "address": _addressController.text,
        "email": _emailController.text,
        "password": _passController.text,
        "latitude": _latitude,
        "longitude": _longitude,
      }),
      headers: headers,
    );
    print(res.body);
    return res;
  }

  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);
    _latitude = "${position.latitude}";
    _longitude = "${position.longitude}";
    setState(() {
      locationMessage =
          "Latitude: ${position.latitude} , Longitude: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    email = _uEmailController.text;
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
                        bottom: 30.0,
                      ),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _uEmailController,
                      hintText: "User Email",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _nicController,
                      hintText: "NIC",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _fNameController,
                      hintText: "First Name",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _lNameController,
                      hintText: "Last Name",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _birthController,
                      hintText: "Birthday",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _mobileController,
                      hintText: "Mobile",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _addressController,
                      hintText: "Address",
                    ),
                    custom_btn(
                      text: "Current Location",
                      onpressed: () {
                        getCurrentLocation();
                      },
                    ),
                    Text(locationMessage),
                    CustomInput(
                      obsecureText: false,
                      controller: _emailController,
                      hintText: "Email",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _passController,
                      hintText: "Password",
                    ),
                    CustomInput(
                      obsecureText: false,
                      controller: _confirmpassController,
                      hintText: "Confirm Password",
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: custom_btn(
                        text: "Update",
                        outline: false,
                        onpressed: () {
                          setState(() {
                            if (_passController.text !=
                                _confirmpassController.text) {
                              print("Password Does not Match");
                            } else {
                              updateData();
                            }
                          });
                        },
                        // onpressed: () {
                        //   Navigator.push(context, MaterialPageRoute(
                        //       builder: (context) => LogIN()
                        //   ),
                        //   );
                        // },
                      ),
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
