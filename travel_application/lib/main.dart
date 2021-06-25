import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_application/detail_page.dart';
import 'package:travel_application/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      color: const Color(0xFF153C56),
      theme: ThemeData(
        fontFamily: GoogleFonts.karla().fontFamily,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: Colors.blue[700],
          unselectedItemColor: Colors.black45,
        ),
      ),
      routes: <String, WidgetBuilder>{
        'home': (context) => HomePage(),
        'detail': (context) => DetailPage(),
      },
      initialRoute: 'home',
    );
  }
}
