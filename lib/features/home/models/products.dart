import 'dart:convert';

class Product {
  int id;
  String title;
  double price;
  String? brand;
  double rating;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.rating,
    required this.thumbnail,
  });

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? brand,
    double? rating,
    String? thumbnail,
  }) => Product(
    id: id ?? this.id,
    title: title ?? this.title,
    price: price ?? this.price,
    brand: brand ?? this.brand,
    rating: rating ?? this.rating,
    thumbnail: thumbnail ?? this.thumbnail,
  );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    brand: json["brand"],
    rating: json["rating"]?.toDouble(),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "brand": brand,
    "rating": rating,
    "thumbnail": thumbnail,
  };
}
