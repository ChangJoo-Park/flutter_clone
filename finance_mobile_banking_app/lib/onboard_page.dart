import 'package:finance_mobile_banking_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 48),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        'Your\nsavings\nare safe',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Color(0xFF1D0D0B)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        '''You can keep money in your account
without having to worry about
getting your money stolen.''',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Color(0xFF5B5B79)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: -150,
                    bottom: -250,
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Color(0xFFC33C27),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -120,
                    bottom: -100,
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6BE90),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -45,
                    bottom: -110,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFF76A19E),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 30,
                    child: ClipOval(
                      child: Container(
                        color: Colors.amber,
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return HomePage();
                                }),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Color(0xFF17181C),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Start",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    FontAwesomeIcons.arrowRight,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
