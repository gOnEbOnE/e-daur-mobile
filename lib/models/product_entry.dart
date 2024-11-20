// To parse this JSON data, do
//
//     final materialEntry = materialEntryFromJson(jsonString);

import 'dart:convert';

List<MaterialEntry> materialEntryFromJson(String str) => List<MaterialEntry>.from(json.decode(str).map((x) => MaterialEntry.fromJson(x)));

String materialEntryToJson(List<MaterialEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaterialEntry {
    String model;
    String pk;
    Fields fields;

    MaterialEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory MaterialEntry.fromJson(Map<String, dynamic> json) => MaterialEntry(
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
    String nama;
    DateTime time;
    int harga;
    String deskripsi;
    String image;
    int rating;

    Fields({
        required this.user,
        required this.nama,
        required this.time,
        required this.harga,
        required this.deskripsi,
        required this.image,
        required this.rating,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        nama: json["nama"],
        time: DateTime.parse(json["time"]),
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        image: json["image"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "nama": nama,
        "time": "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "harga": harga,
        "deskripsi": deskripsi,
        "image": image,
        "rating": rating,
    };
}
