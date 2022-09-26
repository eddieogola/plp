import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        required this.id,
        required this.name,
        required this.summary,
        this.description,
        required this.price,
        required this.rating,
    });

    int id;
    String name;
    String summary;
    String? description;
    String price;
    int rating;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        summary: json["summary"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "summary": summary,
        "description": description,
        "price": price,
        "rating": rating,
    };
}