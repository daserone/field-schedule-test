import 'dart:convert';

FieldModel fieldModelFromJson(String str) =>
    FieldModel.fromJson(json.decode(str));

String fieldModelToJson(FieldModel data) => json.encode(data.toJson());

class FieldModel {
  int? id;
  String? name;
  String? type;
  String? availableFrom;
  String? availableTo;
  int? lat;
  int? lon;
  int? price;
  String? locationName;
  List<InstructorList>? instructorList;
  List<FieldImage>? images;

  FieldModel({
    this.id,
    this.name,
    this.type,
    this.availableFrom,
    this.availableTo,
    this.lat,
    this.lon,
    this.price,
    this.locationName,
    this.instructorList,
    this.images,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) => FieldModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        availableFrom: json["availableFrom"],
        availableTo: json["availableTo"],
        lat: json["lat"],
        lon: json["lon"],
        price: json["price"],
        locationName: json["location_name"],
        instructorList: json["instructorList"] == null
            ? []
            : List<InstructorList>.from(
                json["instructorList"]!.map((x) => InstructorList.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<FieldImage>.from(
                json["images"]!.map((x) => FieldImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "availableFrom": availableFrom,
        "availableTo": availableTo,
        "lat": lat,
        "lon": lon,
        "price": price,
        "location_name": locationName,
        "instructorList": instructorList == null
            ? []
            : List<dynamic>.from(instructorList!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class FieldImage {
  String? url;

  FieldImage({
    this.url,
  });

  factory FieldImage.fromJson(Map<String, dynamic> json) => FieldImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class InstructorList {
  String? name;
  int? id;

  InstructorList({
    this.name,
    this.id,
  });

  factory InstructorList.fromJson(Map<String, dynamic> json) => InstructorList(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
