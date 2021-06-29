import 'package:flutter/material.dart';
import 'package:poll/poll_grid.dart';
import 'package:poll/poll_list.dart';

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
      home: MyHomePage(title: 'Flutter Grid/List Poll'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Poll Grid List'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PollGridPage(),
              ));
            },
          ),
          ListTile(
            title: Text('Poll List'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PollListPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
