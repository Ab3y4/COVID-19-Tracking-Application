import 'dart:developer';

import 'package:api_app/Tabs/placesTab.dart';
import 'package:api_app/Widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_app/Screens/LogIn.dart';

class QrTab extends StatefulWidget {
  @override
  _QrTabState createState() => _QrTabState();
}

class _QrTabState extends State<QrTab> {
  String locationId = "";
  String uEmail;
  String date;
  String time;

  final TextEditingController _uEmailController = TextEditingController();

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accesstoken":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFwaS13ZWItMjQiLCJpYXQiOjE2MTcwNzgzOTh9.Nu2TRql1dN09KEKWiQvdIsWWTaVAbEcuhT_GwMHr13I",
  };

  qrSend() async {
    var res = await http.post(
      Uri.parse("https://api-dev-24.herokuapp.com/api/user/save/locations"),
      body: jsonEncode({
        "date": date,
        "time": time,
        "locationId": locationId,
        "email": uEmail
      }),
      headers: headers,
    );
    print(res.body);
    return res;
  }

  scanQRCode() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.QR)
        .then((value) => setState(() => locationId = value));
  }

  String dateShower() {
    String newDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    return newDate;
  }

  String timeShower() {
    String newTime = DateFormat.Hm().format(DateTime.now()).toString();
    return newTime;
  }

  @override
  Widget build(BuildContext context) {
    uEmail = _uEmailController.text;
    time = timeShower();
    date = dateShower();
    locationId = locationId;
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locationId,
              style: TextStyle(fontSize: 25),
            ),
            CustomInput(
              controller: _uEmailController,
              hintText: "User Email",
              obsecureText: false,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (locationId == null || locationId == "-1") {
                    print("Scan Again");
                  } else {
                    print(uEmail);
                    qrSend();
                  }
                });
              },
              child: Text('Send Location'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: () => scanQRCode(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void initState() {
    dateShower();
    timeShower();
    super.initState();
  }
}
