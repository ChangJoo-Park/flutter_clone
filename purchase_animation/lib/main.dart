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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;

  void _incrementCounter() {
    setState(() => isOpen = !isOpen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Color(0xFFE7E9DE),
              child: Center(
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Image.asset('assets/tree.png'),
                ),
              ),
            ),
          ),
          // Barrier
          AnimatedOpacity(
            curve: Curves.easeOutCubic,
            opacity: isOpen ? 0.6 : 0.0,
            duration: Duration(milliseconds: 200),
            child: const ModalBarrier(
              dismissible: false,
              color: Colors.grey,
            ),
          ),
          // Fake Modal
          Positioned(
            left: 0,
            bottom: 0,
            child: AnimatedContainer(
              curve: Curves.easeOutCubic,
              duration: Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width,
              height: isOpen ? 600 : 240,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: GestureDetector(
                  onTap: _incrementCounter,
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              'Eureka Tree',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: GoogleFonts.suezOne().fontFamily,
                              ),
                            )),
                        Container(
                            child: Text(
                          'Citrus Limon \"Eureka\"',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        )),
                        Divider(color: Colors.black38, thickness: 2.0),
                        Spacer(),
                        AnimatedContainer(
                          alignment: Alignment.topCenter,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeOutCubic,
                          height: isOpen ? 370 : 0,
                          child: AnimatedOpacity(
                            opacity: isOpen ? 1 : 0,
                            curve: Curves.easeOutCubic,
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      margin: const EdgeInsets.only(bottom: 16),
                                      child: Text(
                                        'The Eureka lemon tree is an evergreen that produces pink-fleshed lemons all year. The standard Eureka grows to a height of 20 feet but a smaller dwarf version is available.',
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1.6,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                              Icons.device_thermostat_sharp),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Temperature',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Minimum temperature 59°F (15°C)',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black45),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.wb_sunny),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Light',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Place in a bright and sunny area.',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black45),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.water),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Water',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'Water moderately',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black45),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(width: 100),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF8FBD4B)),
                                onPressed: () {},
                                child: Text('ADD'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
