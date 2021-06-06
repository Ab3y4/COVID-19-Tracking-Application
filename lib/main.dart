import 'package:api_app/Screens/LandingPage.dart';
import 'package:api_app/Screens/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:api_app/Screens/LandingPage.dart';

import 'Screens/LandingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
          accentColor: Colors.blue
      ),
      home: LandingPage(),
    );
  }
}


