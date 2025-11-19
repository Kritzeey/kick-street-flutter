import 'dart:convert';

List<NewsEntry> newsEntryFromJson(String str) =>
    List<NewsEntry>.from(json.decode(str).map((x) => NewsEntry.fromJson(x)));

String newsEntryToJson(List<NewsEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsEntry {
  String id;
  int userId;
  String name;
  int price;
  String description;
  String thumbnail;
  String category;
  bool isFeatured;
  int stock;
  String brand;
  DateTime createdAt;

  NewsEntry({
    required this.id,
    required this.userId,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.stock,
    required this.brand,
    required this.createdAt,
  });

  factory NewsEntry.fromJson(Map<String, dynamic> json) => NewsEntry(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    category: json["category"],
    isFeatured: json["is_featured"],
    stock: json["stock"],
    brand: json["brand"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "price": price,
    "description": description,
    "thumbnail": thumbnail,
    "category": category,
    "is_featured": isFeatured,
    "stock": stock,
    "brand": brand,
    "created_at": createdAt.toIso8601String(),
  };
}
