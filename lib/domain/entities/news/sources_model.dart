import 'dart:convert';

SourcesModel sourcesModelFromJson(String str) =>
    SourcesModel.fromJson(json.decode(str));

String sourcesModelToJson(SourcesModel data) => json.encode(data.toJson());

class SourcesModel {
  SourcesModel({
    this.status,
    this.sources,
  });

  String? status;
  List<Source>? sources;

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        status: json["status"],
        sources: json["sources"] == null
            ? []
            : List<Source>.from(
                json["sources"]!.map((x) => Source.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sources": sources == null
            ? []
            : List<dynamic>.from(sources!.map((x) => x.toJson())),
      };
}

class Source {
  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
      };
}
