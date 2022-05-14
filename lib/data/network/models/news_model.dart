// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);
import 'dart:convert';

class ArticleModel {
  ArticleModel({
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  final String title;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;

  factory ArticleModel.fromRawJson(String str) => ArticleModel.fromJson(json.decode(str));

//  String toRawJson() => json.encode(toJson());

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    title: json["title"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "title": title,
  //   "url": url,
  //   "urlToImage": urlToImage,
  //   "publishedAt": publishedAt.toIso8601String(),
  // };
}
