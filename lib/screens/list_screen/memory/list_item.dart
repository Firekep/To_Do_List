class Item {
  String? title;
  String? content;
  bool? done;
  bool? contentIsActive;

  Item({
    required this.title,
    required this.content,
    this.done = false,
    this.contentIsActive = false,
  });

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    content = json['content'] as String;
    done = json['done'] as bool;
    contentIsActive = json['favorite'] as bool;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'done': done,
      'favorite' : contentIsActive,
    };
  }
}
