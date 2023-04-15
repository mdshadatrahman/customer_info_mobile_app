class StoreModel {
  int? storeId;
  String? storeName;
  String? ownerName;
  dynamic informalAddress;
  String? phone;
  String? email;
  String? website;
  String? description;
  String? image;
  String? about;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Category? category;
  FormalAddress? formalAddress;

  StoreModel({
    this.storeId,
    this.storeName,
    this.ownerName,
    this.informalAddress,
    this.phone,
    this.email,
    this.website,
    this.description,
    this.image,
    this.about,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.category,
    this.formalAddress,
  });

  StoreModel.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeName = json['store_name'];
    ownerName = json['owner_name'];
    informalAddress = json['informal_address'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    description = json['description'];
    image = json['image'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    category = json['category'] != null ? Category?.fromJson(json['category']) : null;
    formalAddress = json['formal_address'] != null ? FormalAddress?.fromJson(json['formal_address']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['store_id'] = storeId;
    data['store_name'] = storeName;
    data['owner_name'] = ownerName;
    data['informal_address'] = informalAddress;
    data['phone'] = phone;
    data['email'] = email;
    data['website'] = website;
    data['description'] = description;
    data['image'] = image;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (category != null) {
      data['category'] = category?.toJson();
    }
    if (formalAddress != null) {
      data['formal_address'] = formalAddress?.toJson();
    }
    return data;
  }
}

class Category {
  int? categoryId;
  String? categoryName;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Category({
    this.categoryId,
    this.categoryName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class FormalAddress {
  int? formalAddressId;
  String? country;
  String? division;
  String? district;
  String? thana;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  FormalAddress({
    this.formalAddressId,
    this.country,
    this.division,
    this.district,
    this.thana,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  FormalAddress.fromJson(Map<String, dynamic> json) {
    formalAddressId = json['formal_address_id'];
    country = json['country'];
    division = json['division'];
    district = json['district'];
    thana = json['thana'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['formal_address_id'] = formalAddressId;
    data['country'] = country;
    data['division'] = division;
    data['district'] = district;
    data['thana'] = thana;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
