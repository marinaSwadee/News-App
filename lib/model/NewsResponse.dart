

import 'SourceResponse.dart';

class NewsResponse {
  NewsResponse({
      this.status,
      this.totalResults,
      this.articles,
      this.message,
    this.code
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];

    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(News.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<News>? articles;
  String? message;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":null,"name":"Gizmodo.com"}
/// author : "Artem Golub and Thomas Germain"
/// title : "Why Bitcoin Won’t Reach $1,000,000"
/// description : "Coindesk’s Andy Baehr says Bitcoin is just a normal, bread and butter investment now."
/// url : "https://gizmodo.com/why-bitcoin-won-t-reach-1-000-000-1851252185"
/// urlToImage : "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/d27f57afb7ac3501d4d69ce6afff190b.jpg"
/// publishedAt : "2024-02-13T18:15:00Z"
/// content : "Coindesks Andy Baehr says Bitcoin is just a normal, bread and butter investment now."

class News {
  News({
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}

/// id : null
/// name : "Gizmodo.com"

