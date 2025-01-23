import 'dart:convert';

// To parse this JSON data, do
// final model = modelFromJson(jsonString);

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
    int id;
    AuthorDetails authorDetails;
    AuthorBookDetails authorBookDetails;

    Model({
        required this.id,
        required this.authorDetails,
        required this.authorBookDetails,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        authorDetails: AuthorDetails.fromJson(json["authorDetails"]),
        authorBookDetails: AuthorBookDetails.fromJson(json["authorBookDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "authorDetails": authorDetails.toJson(),
        "authorBookDetails": authorBookDetails.toJson(),
    };
}

class AuthorBookDetails {
    List<Language> language;

    AuthorBookDetails({
        required this.language,
    });

    factory AuthorBookDetails.fromJson(Map<String, dynamic> json) => AuthorBookDetails(
        language: List<Language>.from(json["language"].map((x) => Language.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "language": List<dynamic>.from(language.map((x) => x.toJson())),
    };
}

class Language {
    String langCode;
    String langName;

    Language({
        required this.langCode,
        required this.langName,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        langCode: json["langCode"],
        langName: json["langName"],
    );

    Map<String, dynamic> toJson() => {
        "langCode": langCode,
        "langName": langName,
    };
}

class AuthorDetails {
    String name;

    AuthorDetails({
        required this.name,
    });

    factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
