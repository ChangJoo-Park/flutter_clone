import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:poll/poll.dart';

class PollGridPage extends StatefulWidget {
  const PollGridPage({Key? key}) : super(key: key);

  @override
  _PollGridPageState createState() => _PollGridPageState();
}

class _PollGridPageState extends State<PollGridPage> {
  late final Poll poll;
  bool loaded = false;
  bool maximumSelected = false;
  List<String> selected = [];

  @override
  void initState() {
    rootBundle.loadString('data/poll.json').then((data) {
      var json = jsonDecode(data);
      var parsed = Poll.fromJSON(json);
      setState(() {
        poll = parsed;
        loaded = true;
      });
    }).catchError((error) {
      print(error);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poll GridList'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showGeneralDialog(
                useRootNavigator: true,
                context: context,
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return AlertDialog(
                    buttonPadding: const EdgeInsets.all(4),
                    title: Text('Info'),
                    content: SingleChildScrollView(
                      child: Text(poll.toString(),
                          style:
                              TextStyle(fontSize: 12, fontFamily: 'monospace')),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: loaded
          ? AnimationLimiter(
              child: GridView.builder(
                itemCount: poll.options.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  PollOption option = poll.options[index];
                  return AnimationConfiguration.staggeredGrid(
                    columnCount: 2,
                    position: index,
                    duration: Duration(milliseconds: 375),
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: PollOptionGridItem(
                          id: option.id!,
                          name: option.name,
                          selected: selected.contains(option.id),
                          image: option.thumbnail!,
                          onTap: (String id) {
                            if (selected.contains(id)) {
                              selected.remove(id);
                            } else {
                              if (maximumSelected) {
                                return;
                              }
                              selected.add(id);
                            }
                            setState(() {
                              maximumSelected =
                                  selected.length >= poll.maximum!;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class PollOptionGridItem extends StatelessWidget {
  const PollOptionGridItem({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.selected,
    this.onTap,
  }) : super(key: key);

  final String id;
  final String name;
  final bool selected;
  final String image;
  final Function(String id)? onTap;
  @override
  Widget build(BuildContext context) {
    DecorationImage? decorationImage = image != null
        ? DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(image),
          )
        : null;

    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(id);
      },
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 150),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            switchInCurve: Curves.easeInCubic,
            switchOutCurve: Curves.easeOutCubic,
            child: selected
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.red.shade400,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          AnimatedPadding(
            curve: Curves.ease,
            padding: selected
                ? const EdgeInsets.all(12.0)
                : const EdgeInsets.all(8.0),
            duration: Duration(milliseconds: 300),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: decorationImage,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    child: Text(name),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
