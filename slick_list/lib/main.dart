import 'dart:ui';

import 'package:flutter/material.dart';

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
      routes: {
        '/home': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
      },
      initialRoute: '/home',
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
    final double screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          )
        ],
      ),
      body: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: 100,
        addRepaintBoundaries: true,
        itemBuilder: (BuildContext context, int index) {
          final double height = 100;
          final int maximumItemInOneScreen = (screenHeigth / height).ceil();
          int delayDelta = index;
          if (delayDelta > maximumItemInOneScreen) {
            delayDelta = -1;
          }

          final int duration = 350;
          final int delay = (duration * delayDelta) ~/ 2;

          return Tile(
            key: ValueKey("tile_$index"),
            delay: delay,
            duration: duration,
            height: height,
          );
        },
      ),
    );
  }
}

class Tile extends StatefulWidget {
  const Tile({
    Key? key,
    required this.delay,
    required this.duration,
    required this.height,
  }) : super(key: key);

  final int delay;
  final int duration;
  final double height;
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<double> translateAnimation;
  late final Animation<double> scaleAnimation;
  late final Animation<double> opacityAnimation;
  late final canAnimate;
  @override
  void initState() {
    canAnimate = widget.delay >= 0;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    translateAnimation =
        Tween<double>(begin: 150, end: 0.0).animate(CurvedAnimation(
      curve: Curves.easeOutCubic,
      parent: animationController,
    ));

    scaleAnimation = Tween<double>(begin: 0.95, end: 1).animate(CurvedAnimation(
      curve: Curves.easeOutCubic,
      parent: animationController,
    ));

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      curve: Curves.easeOutCubic,
      parent: animationController,
    ));

    if (canAnimate) {
      Future.delayed(Duration(milliseconds: widget.delay),
          () => animationController.forward());
    }
    super.initState();
  }

  @override
  void dispose() {
    if (animationController != null) {
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: translateAnimation,
      builder: (BuildContext context, Widget? child) {
        if (!canAnimate) return child!;

        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: Transform.translate(
              offset: Offset(0, translateAnimation.value),
              child: child!,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: widget.height,
        decoration: BoxDecoration(color: Colors.blue),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
