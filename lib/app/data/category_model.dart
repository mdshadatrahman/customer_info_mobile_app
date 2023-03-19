class CategoryModel {
  final String? id;
  final String? title;
  final String? subtitle;

  CategoryModel({
    this.id,
    this.title,
    this.subtitle,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
