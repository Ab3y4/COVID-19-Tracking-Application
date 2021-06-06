import 'package:api_app/Widgets/custom_btn.dart';
import 'package:api_app/Screens/LogIn.dart';
import 'package:api_app/Widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import 'LogIn.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                        top: 100,
                      ),
                      child:
                      Image.asset('Assets/page1.jpg', width: 500, height: 250,)),
                  Container(
                    padding: EdgeInsets.only(
                        top: 30
                    ),
                    child: Text("Covid-19 Tracker",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 50
                    ),
                    child: custom_btn(
                      text: "Connect with Email",
                      outline: false,
                      onpressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LogIN()
                        ),);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(
                      bottom: 60
                  ),
                  child:
                  Text("Centers for Disease Control and Prevention (CDC)")),
            ],
          ),
        ),
      ),
    );
  }
}