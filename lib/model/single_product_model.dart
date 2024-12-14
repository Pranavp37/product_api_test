// To parse this JSON data, do
//
//     final singleModel = singleModelFromJson(jsonString);

import 'dart:convert';

// List<SingleModel> singleModelFromJson(String str) => List<SingleModel>.from(
//     json.decode(str).map((x) => SingleModel.fromJson(x)));

SingleModel onesingleModelFromJson(String str) =>
    SingleModel.fromJson(jsonDecode(str));

String singleModelToJson(List<SingleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleModel {
  String? id;
  String? name;
  Data? data;

  SingleModel({
    this.id,
    this.name,
    this.data,
  });

  factory SingleModel.fromJson(Map<String, dynamic> json) => SingleModel(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
      };
}

class Data {
  String? color;
  int? capacityGb;
  double? price;
  String? capacity;
  double? screenSize;

  Data({
    this.color,
    this.capacityGb,
    this.price,
    this.capacity,
    this.screenSize,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacityGb: json["capacity GB"],
        price: json["price"]?.toDouble(),
        capacity: json["Capacity"],
        screenSize: json["Screen size"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "capacity GB": capacityGb,
        "price": price,
        "Capacity": capacity,
        "Screen size": screenSize,
      };
}
