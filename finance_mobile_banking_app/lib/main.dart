import 'package:finance_mobile_banking_app/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: Colors.black,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        fontFamily: GoogleFonts.rubik().fontFamily,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.rubik().fontFamily,
                fontSize: 54.0,
                color: Colors.black87,
              ),
              bodyText1: TextStyle(
                fontFamily: GoogleFonts.rubik().fontFamily,
                fontSize: 14.0,
                height: 2,
                color: Colors.black54,
              ),
              button: TextStyle(
                fontFamily: GoogleFonts.rubik().fontFamily,
              ),
            ),
      ),
      home: OnboardPage(),
    );
  }
}
