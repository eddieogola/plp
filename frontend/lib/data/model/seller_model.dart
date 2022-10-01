import 'dart:convert';

List<List<String>> cityFromJson(String str) => List<List<String>>.from(
    json.decode(str).map((x) => List<String>.from(x.map((x) => x))));

String cityToJson(List<List<String>> data) => json.encode(
    List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Seller> sellerFromJson(String str) =>
    List<Seller>.from(json.decode(str).map((x) => Seller.fromJson(x)));

String sellerToJson(List<Seller> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Seller {
  Seller({
    required this.id,
    required this.name,
    required this.address,
    required this.product,
    required this.joinDate,
    required this.rating,
  });

  int id;
  String name;
  List<Address> address;
  List<Product> product;
  DateTime joinDate;
  int rating;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        name: json["name"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        joinDate: DateTime.parse(json["join_date"]),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "join_date":
            "${joinDate.year.toString().padLeft(4, '0')}-${joinDate.month.toString().padLeft(2, '0')}-${joinDate.day.toString().padLeft(2, '0')}",
        "rating": rating,
      };
}

class Address {
  Address({
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  String city;
  double latitude;
  double longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Product {
  Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.summary,
    required this.description,
    required this.price,
    required this.rating,
  });

  int id;
  String imageUrl;
  String name;
  String summary;
  String description;
  String price;
  int rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        summary: json["summary"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
        "summary": summary,
        "description": description,
        "price": price,
        "rating": rating,
      };
}
