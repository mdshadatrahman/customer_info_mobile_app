// To parse this JSON data, do
//
//     final subcategory = subcategoryFromJson(jsonString);

import 'dart:convert';

Subcategory subcategoryFromJson(String str) => Subcategory.fromJson(json.decode(str));

String subcategoryToJson(Subcategory data) => json.encode(data.toJson());

class Subcategory {
  Subcategory({
    this.subCategoryId,
    this.subCategoryName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.category,
  });

  int? subCategoryId;
  String? subCategoryName;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Category? category;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        subCategoryId: json["subCategory_id"],
        subCategoryName: json["subCategory_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "subCategory_id": subCategoryId,
        "subCategory_name": subCategoryName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "category": category?.toJson(),
      };
}

class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? categoryId;
  String? categoryName;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
