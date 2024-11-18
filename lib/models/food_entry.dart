// To parse this JSON data, do
//
//     final foodEntry = foodEntryFromJson(jsonString);

import 'dart:convert';

List<FoodEntry> foodEntryFromJson(String str) => List<FoodEntry>.from(json.decode(str).map((x) => FoodEntry.fromJson(x)));

String foodEntryToJson(List<FoodEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodEntry {
    String model;
    String pk;
    Fields fields;

    FoodEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory FoodEntry.fromJson(Map<String, dynamic> json) => FoodEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String img;
    String name;
    int price;
    String ready;
    String description;

    Fields({
        required this.user,
        required this.img,
        required this.name,
        required this.price,
        required this.ready,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        img: json["img"],
        name: json["name"],
        price: json["price"],
        ready: json["ready"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "img": img,
        "name": name,
        "price": price,
        "ready": ready,
        "description": description,
    };
}
