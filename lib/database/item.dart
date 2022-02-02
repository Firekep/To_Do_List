class Item {
  String? title;
  String? content;
  bool? done;
  bool? favorite;

  Item({
    required this.title,
    required this.content,
    this.done = false,
    this.favorite = false,
  });

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    content = json['content'] as String;
    done = json['done'] as bool;
    favorite = json['favorite'] as bool;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'done': done,
      'favorite' : favorite,
    };
  }
}
