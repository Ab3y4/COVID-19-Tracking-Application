import 'dart:io';

import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:api_app/Tabs/qrTab.dart';
import 'dart:convert';

class PlacesTab extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() {
  //   return _PlacesTabState();
  // }
  _PlacesTabState createState() => _PlacesTabState();
}

class _PlacesTabState extends State<PlacesTab> {
  Map mapResponse;
  List listOfContent;
  String email;

  final TextEditingController _emailController = TextEditingController();

  @override
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accesstoken":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFwaS13ZWItMjQiLCJpYXQiOjE2MTcwNzgzOTh9.Nu2TRql1dN09KEKWiQvdIsWWTaVAbEcuhT_GwMHr13I",
  };

  Future fetchData() async {
    http.Response response;
    response = await http.get(
      Uri.parse(
          "https://api-dev-24.herokuapp.com/api/user/$email/locations/page/1"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listOfContent = mapResponse['content'];
      });
    }
  }

  @override
  void initState() {
    setState(() {
      fetchData();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    email = _emailController.text;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Visited Places",
        ),
      ),
      body: mapResponse == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: [
                  CustomInput(
                    hintText: "Enter Email",
                    obsecureText: false,
                    controller: _emailController,
                  ),
                  custom_btn(
                      text: "Get Places",
                      onpressed: () {
                        if (_emailController.text == "tharinda@gmail.com") {
                          print(email);
                          fetchData();
                        } else {
                          print("wrong Email");
                        }
                      }),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              color: Colors.lightBlue,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Place -    ' +
                                        listOfContent[index]['locationId'],
                                    style: TextStyle(fontSize: 24),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                      'Date -    ' +
                                          listOfContent[index]['date'],
                                      style: TextStyle(fontSize: 24),
                                      textAlign: TextAlign.center),
                                  Text(
                                      'Time -    ' +
                                          listOfContent[index]['time'],
                                      style: TextStyle(fontSize: 24),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount:
                              listOfContent == null ? 0 : listOfContent.length,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
