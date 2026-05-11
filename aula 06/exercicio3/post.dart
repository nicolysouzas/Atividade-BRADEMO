import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  String toJson() {
    Map<String, dynamic> input = {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
    };

    return jsonEncode(input);
  }

  static Post fromJson(String jsonSource) {
    Map<String, dynamic> item =
        jsonDecode(jsonSource);

    return Post(
      item['userId'],
      item['id'],
      item['title'],
      item['body'],
    );
  }
}