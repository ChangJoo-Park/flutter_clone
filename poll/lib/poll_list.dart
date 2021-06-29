import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:poll/poll.dart';

class PollListPage extends StatefulWidget {
  const PollListPage({Key? key}) : super(key: key);

  @override
  _PollListPageState createState() => _PollListPageState();
}

class _PollListPageState extends State<PollListPage> {
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
      body: loaded
          ? AnimationLimiter(
              child: ListView.builder(
                itemCount: poll.options.length,
                itemBuilder: (BuildContext context, int index) {
                  PollOption option = poll.options[index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: PollOptionListItem(
                          id: option.id!,
                          selected: selected.contains(option.id!),
                          option: option,
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
          : Container(),
    );
  }
}

class PollOptionListItem extends StatelessWidget {
  const PollOptionListItem({
    Key? key,
    required this.selected,
    required this.option,
    required this.id,
    required this.onTap,
  }) : super(key: key);

  final bool selected;
  final PollOption option;
  final String id;
  final Function(String id)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onTap != null) onTap!(id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 16),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: selected ? Colors.white : Colors.transparent,
                      style: BorderStyle.solid,
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        option.thumbnail!,
                      ),
                    ),
                  ),
                ),
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
                      ? Container(
                          width: 60,
                          height: 60,
                          child: Icon(
                            Icons.check,
                            size: 50,
                            color: Colors.white,
                            key: ValueKey('$option.id_CHECK_ICON'),
                          ),
                        )
                      : Container(key: ValueKey('$option.id_NO_CHECK')),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      option.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '소개',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
