import 'dart:convert';

class TodoRequest {
  TodoRequest({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  static TodoRequest todoRequestFromJson(String str) =>
      TodoRequest.fromJson(json.decode(str));

  static String todoRequestToJson(TodoRequest data) =>
      json.encode(data.toJson());

  factory TodoRequest.fromJson(Map<String, dynamic> json) => TodoRequest(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
