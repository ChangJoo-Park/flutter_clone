import 'package:finance_mobile_banking_app/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  int tabIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFFC33C27),
        unselectedItemColor: Color(0xFFACABB0),
        items: [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: ""),
          BottomNavigationBarItem(
              icon: RotatedBox(
                  quarterTurns: 1, child: Icon(FontAwesomeIcons.exchangeAlt)),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.creditCard), label: ""),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: ""),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Graphics
            Positioned(
              left: 100,
              top: -130,
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
              left: -100,
              top: -70,
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
              left: -60,
              top: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF76A19E),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Container(
              height: kToolbarHeight,
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.bell, color: Colors.white),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kToolbarHeight),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text(
                    'Total assets',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFF).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Total assets (HKD)',
                            style: TextStyle(
                                color: Color(0xFF5B5B79), fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '67,000.90',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Color(0xFF212121)),
                              ),
                              IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.eye,
                                  color: Color(0xFF5B5B79),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TransactionPage(),
                                  ));
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Bank account : ',
                                style: TextStyle(color: Color(0xFF212121)),
                              ),
                              TextSpan(
                                text: '320 230 901 3001',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFF1D0D0B),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon:
                              Icon(FontAwesomeIcons.sync, color: Colors.white),
                          onPressed: () {
                            print('Hello');
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFF2F2F2))),
                    ),
                    child: TabBar(
                      controller: tabController,
                      labelColor: Color(0xFFC33C27),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2.0,
                      indicatorColor: Color(0xFFC33C27),
                      unselectedLabelColor: Color(0xFF5B5B79),
                      onTap: (index) {
                        setState(() => tabIndex = index);
                      },
                      tabs: [
                        Tab(child: Text('HKD')),
                        Tab(child: Text('USD')),
                        Tab(child: Text('GDP')),
                      ],
                    ),
                  ),
                ),
                Builder(
                  builder: (BuildContext context) {
                    switch (tabIndex) {
                      case 0:
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      default:
                    }

                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 32),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 200,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xFFC33C27),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 24),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        FontAwesomeIcons.dollarSign,
                                        color: Color(0xFFC33C27),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '22.000.50',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Text(
                                      'Current storage',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: -.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: 200,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xFF76A19E),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 24),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        FontAwesomeIcons.fileAlt,
                                        color: Color(0xFF76A19E),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '22.000.50',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Text(
                                      'Time deposits',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: -.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
