// To parse this JSON data, do
//
//     final modelPost = modelPostFromMap(jsonString);

import 'dart:convert';

List<ModelPost> modelPostFromMap(String str) =>
    List<ModelPost>.from(json.decode(str).map((x) => ModelPost.fromMap(x)));

String modelPostToMap(List<ModelPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ModelPost {
  int userId;
  int id;
  String title;
  String body;

  ModelPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ModelPost.fromMap(Map<dynamic, dynamic> json) => ModelPost(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
