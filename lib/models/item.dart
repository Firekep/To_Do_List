class Item {
  String? title;
  String? content;
  bool? done;

  Item({
    required this.title,
    required this.content,
    this.done = false,
  });

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    content = json['content'] as String;
    done = json['done'] as bool;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'done': done,
    };
  }
}
