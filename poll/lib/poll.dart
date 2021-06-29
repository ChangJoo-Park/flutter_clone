class Poll {
  String? title;
  String? description;
  int? minimum;
  int? maximum;
  List<PollOption> options = [];

  Poll({
    this.title,
    this.description,
    this.minimum,
    this.maximum,
    required this.options,
  });

  factory Poll.fromJSON(Map<String, dynamic> data) => Poll(
      title: data['title'],
      description: data['description'],
      maximum: data['maximum'] ?? 1,
      minimum: data['maximum'] ?? 1,
      options: ((data['options'] ?? []) as List)
          .map((element) => PollOption.fromJSON(element))
          .toList());

  @override
  String toString() {
    return '''
title : $title
description: $description
minimum : $minimum
maximum : $maximum
number of options : ${options.length}
options : $options
    ''';
  }
}

class PollOption {
  String? id;
  String name;
  String? thumbnail;

  PollOption({this.id, required this.name, this.thumbnail});

  factory PollOption.fromJSON(Map<String, dynamic> data) => PollOption(
        id: data['id'],
        name: data['name'],
        thumbnail: data['thumbnail'],
      );

  @override
  String toString() {
    return '''
id: $id
name: $name
thumbnail: $thumbnail
''';
  }
}
