import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:api_app/Screens/LogIn.dart';
import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'LogIn.dart';
import 'dart:convert';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

  sendData() async {
    var res = await http.post(
      Uri.parse("https://api-dev-24.herokuapp.com/api/user/register"),
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

  // getdata() async{
  //   var res = await http.get(Uri.parse("https://api-dev-24.herokuapp.com/api/user/register"));
  //   if(res.statusCode == 200){
  //     var jsonObj = json.decode(res.body);
  //     return jsonObj['result'];
  //   }
  // }

  var locationMessage = "";

  void getCurrentLocation() async{
    var position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);
    _latitude = "${position.latitude}";
    _longitude = "${position.longitude}";
    setState(() {
      locationMessage = "Latitude: ${position.latitude} , Longitude: ${position.longitude}";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      CustomInput(
                        controller: _nicController,
                        hintText: "NIC",
                      ),
                      CustomInput(
                        controller: _fNameController,
                        hintText: "First Name",
                      ),
                      CustomInput(
                        controller: _lNameController,
                        hintText: "Last Name",
                      ),
                      CustomInput(
                        controller: _birthController,
                        hintText: "Birthday",
                      ),
                      CustomInput(
                        controller: _mobileController,
                        hintText: "Mobile",
                      ),
                      CustomInput(
                        controller: _addressController,
                        hintText: "Address",
                      ),
                      custom_btn(
                        text: "Current Location",
                        onpressed: (){
                          getCurrentLocation();
                        },
                      ),
                      Text(locationMessage),
                      CustomInput(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      CustomInput(
                        controller: _passController,
                        hintText: "Password",
                      ),
                      CustomInput(
                        controller: _confirmpassController,
                        hintText: "Confirm Password",
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: custom_btn(
                          text: "Sign In",
                          outline: false,
                          onpressed: () {
                            sendData();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogIN()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
