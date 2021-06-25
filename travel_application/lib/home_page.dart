import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            leading: Icon(Icons.dashboard, color: const Color(0xFF193C51)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pin_drop_outlined,
                  color: const Color(0xFF79BDEB),
                ),
                SizedBox(width: 4),
                Text(
                  "Bali, Indonesia",
                  style: TextStyle(
                      color: const Color(0xFF193C51),
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's go trip\nwith us !",
                    style: TextStyle(
                      color: const Color(0xFF193C51),
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Icon(
                              Icons.search,
                              size: 32,
                              color: Color(0xFFB1B4B5),
                            )),
                        Container(
                          child: Text(
                            "Search...",
                            style: TextStyle(
                              color: Color(0xFFB1B4B5),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: const Color(0xFFC3C3C3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF057EF0),
                        border: Border.all(color: Color(0xFFF7F7F7), width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(Icons.beach_access,
                                color: Colors.blue[700]),
                          ),
                          SizedBox(width: 8),
                          Text('Beach', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFF7F7F7), width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.filter_hdr,
                              color: Colors.amber[800],
                            ),
                          ),
                          SizedBox(width: 8),
                          Text('Mountain'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFF7F7F7), width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.park, color: Colors.green),
                          SizedBox(width: 4),
                          Text('Forest'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  LargeItemWidget(
                    image: AssetImage('assets/nusa_panida_island.jpg'),
                    favorite: '2k',
                    name: 'Nusa Panida\nIsland',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('detail');
                    },
                    child: LargeItemWidget(
                      image: AssetImage('assets/komodo_island.jpg'),
                      favorite: '1k',
                      name: 'Komodo\nIsland',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('View All',
                      style: const TextStyle(color: const Color(0xFFC3C3C3))),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SmallListItemWidget(
                    image: AssetImage('assets/phuket.jpg'),
                    name: 'Phuket Island',
                    country: 'Thailand',
                  ),
                  SmallListItemWidget(
                    image: AssetImage('assets/jeju.jpg'),
                    name: 'Jeju Island',
                    country: 'Korea',
                  ),
                  SmallListItemWidget(
                    image: AssetImage('assets/fiji.jpg'),
                    name: 'Wadigi Island',
                    country: 'Fiji',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined), label: 'Article'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Like'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class LargeItemWidget extends StatelessWidget {
  const LargeItemWidget({
    Key? key,
    required this.image,
    required this.favorite,
    required this.name,
  }) : super(key: key);

  final AssetImage image;
  final String favorite;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 180,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xFFBFBAB9).withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Text(
                    favorite,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SmallListItemWidget extends StatelessWidget {
  const SmallListItemWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.country,
  }) : super(key: key);

  final AssetImage image;
  final String name;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: this.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                country,
                style: TextStyle(color: Color(0xFFC0C0C0)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
