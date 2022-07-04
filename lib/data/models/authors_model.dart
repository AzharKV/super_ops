// To parse this JSON data, do
//
//     final authorsModel = authorsModelFromJson(jsonString);

import 'dart:convert';

AuthorsModel authorsModelFromJson(String str) =>
    AuthorsModel.fromJson(json.decode(str));

String authorsModelToJson(AuthorsModel data) => json.encode(data.toJson());

class AuthorsModel {
  AuthorsModel({
    this.count,
    this.pageToken,
    this.messages,
  });

  int? count;
  String? pageToken;
  List<Message>? messages;

  factory AuthorsModel.fromJson(Map<String, dynamic> json) => AuthorsModel(
        count: json["count"] == null ? null : json["count"],
        pageToken: json["pageToken"] == null ? null : json["pageToken"],
        messages: json["messages"] == null
            ? null
            : List<Message>.from(
                json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "pageToken": pageToken == null ? null : pageToken,
        "messages": messages == null
            ? null
            : List<dynamic>.from(messages!.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.content,
    this.updated,
    this.id,
    this.author,
  });

  String? content;
  DateTime? updated;
  int? id;
  Author? author;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        content: json["content"] == null ? null : json["content"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        id: json["id"] == null ? null : json["id"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content,
        "updated": updated == null ? null : updated!.toIso8601String(),
        "id": id == null ? null : id,
        "author": author == null ? null : author!.toJson(),
      };
}

class Author {
  Author({
    this.name,
    this.photoUrl,
  });

  String? name;
  String? photoUrl;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"] == null ? null : json["name"],
        photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "photoUrl": photoUrl == null ? null : photoUrl,
      };
}
