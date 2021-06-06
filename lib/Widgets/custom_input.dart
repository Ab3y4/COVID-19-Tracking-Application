import 'package:api_app/Constants.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomInput extends StatelessWidget {
  CustomInput({this.hintText, this.controller, this.obsecureText});
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? "Empty",
            contentPadding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            )),
        style: Constants.regularDarkText,
      ),
    );
  }
}
