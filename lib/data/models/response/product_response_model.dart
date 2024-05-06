
import 'dart:convert';

class ProductResponseModel {
    final bool succes;
    final String message;
    final List<Product> data;

    ProductResponseModel({
        required this.succes,
        required this.message,
        required this.data,
    });

    factory ProductResponseModel.fromRawJson(String str) => ProductResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
        succes: json["succes"],
        message: json["message"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "succes": succes,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Product {
    final int id;
    final String name;
    final String description;
    final int price;
    final int stok;
    final Category category;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    Product({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.stok,
        required this.category,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stok: json["stok"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stok": stok,
        "category": categoryValues.reverse[category],
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum Category {
    SANDAL,
    SEPATU,
    TAS
}

final categoryValues = EnumValues({
    "Sandal": Category.SANDAL,
    "Sepatu": Category.SEPATU,
    "Tas": Category.TAS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
