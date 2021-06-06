import 'package:api_app/Screens/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:api_app/Screens/HomePage.dart';
import 'package:api_app/Screens/SignUp.dart';
import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Widgets/custom_input.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: Text(
                          "Covid-19 Statistics",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Expanded(
                        flex: 2,
                        child: Container(
                            height: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                border: Border.all(
                                    color: Colors.amberAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(12.0)),
                            margin: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    child: Text(
                                      "Local New Cases",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      "156",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Expanded(
                        flex: 2,
                        child: Container(
                            height: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(12.0)),
                            margin: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    child: Text(
                                      "Local Total Cases",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      "92598",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Expanded(
                        flex: 2,
                        child: Container(
                            height: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(12.0)),
                            margin: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                      left: 10,
                                      right: 10,
                                      bottom: 15,
                                    ),
                                    child: Text(
                                      "Local Total Number of Individuals in Hospital",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      "156",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Expanded(
                        flex: 2,
                        child: Container(
                            height: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                border: Border.all(
                                    color: Colors.redAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(12.0)),
                            margin: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                      ),
                                      child: Text(
                                        "Local Deaths",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Text(
                                        "602",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Expanded(
                        flex: 2,
                        child: Container(
                          height: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              border: Border.all(
                                  color: Colors.amberAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(12.0)),
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: 15,
                                  ),
                                  child: Text(
                                    "Local News Cases",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  child: Text(
                                    "156",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12.0,
                                ),
                              ),
                              // SizedBox(
                              //   height: 17.0,
                              // ),
                              Expanded(
                                // flex: 3,
                                child: Container(
                                  child: custom_btn(
                                    text: "Sign Out",
                                    outline: false,
                                    onpressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LogIN()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
