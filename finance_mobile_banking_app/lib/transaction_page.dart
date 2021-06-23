import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'Transaction',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.black),
                onPressed: () {},
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Enter amount',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    padding: const EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF76A19E),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                '3,000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'USD',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    FontAwesomeIcons.chevronDown,
                                    size: 14,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xFF9BC0BC),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                '3,000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'HKD',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    FontAwesomeIcons.chevronDown,
                                    size: 14,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 80,
                          color: Color(0xFF17181C),
                          child: Icon(FontAwesomeIcons.sync,
                              color: Colors.white, size: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(padding: const EdgeInsets.symmetric(vertical: 16)),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              {
                "title": 'City Bank',
                "datetime": '10.40PM',
                "currency": 'USD',
                "amount": '343',
                "isUp": true,
              },
              {
                "title": 'Shopify',
                "datetime": '10.40PM',
                "currency": 'HKD',
                "amount": '250',
                "isUp": false,
              },
              {
                "title": 'AB Bank',
                "datetime": '10.40PM',
                "currency": 'HKD',
                "amount": '233',
                "isUp": true,
              },
              {
                "title": 'Bank Asia',
                "datetime": '10.40PM',
                "currency": 'USD',
                "amount": '400',
                "isUp": false,
              },
            ]
                .map(
                  (Map<String, dynamic> item) => TransactionListTile(
                    title: item['title'],
                    datetime: item['datetime'],
                    currency: item['currency'],
                    amount: item['amount'],
                    isUp: item['isUp'],
                  ),
                )
                .toList()),
          )
        ],
      ),
    );
  }
}

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    Key? key,
    required this.title,
    required this.datetime,
    required this.currency,
    required this.amount,
    required this.isUp,
  }) : super(key: key);
  final String title;
  final String datetime;
  final String currency;
  final String amount;
  final bool isUp;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Color(isUp ? 0xFF76A19E : 0xFFC33C27).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              isUp ? FontAwesomeIcons.arrowUp : FontAwesomeIcons.arrowDown,
              color: Color(isUp ? 0xFF76A19E : 0xFFC33C27),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, color: Color(0xFF0B1919)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    datetime,
                    style: TextStyle(color: Color(0xFF5B5B79)),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currency,
                style: TextStyle(color: Color(0xFF5B5B79), fontSize: 16),
              ),
              Text(
                '${isUp ? "+" : "-"}\$$amount',
                style: TextStyle(
                    color: Color(isUp ? 0xFF76A19E : 0xFFC33C27),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
