class CategoryModel {
  final int? id;
  final String? categoryName;

  CategoryModel({
    this.id,
    this.categoryName,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['category_id'],
      categoryName: json['category_name'],
    );
  }
}
