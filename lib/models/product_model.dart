import 'package:altamazee/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  int? price;
  String? description;
  int? categoriesId;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Galleries>? galleries;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.categoriesId,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.galleries});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    categoriesId = json['categories_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['galleries'] != null) {
      galleries = <Galleries>[];
      json['galleries'].forEach((v) {
        galleries!.add(Galleries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['categories_id'] = categoriesId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (galleries != null) {
      data['galleries'] = galleries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Galleries {
  int? id;
  int? productsId;
  String? url;
  String? createdAt;
  String? updatedAt;

  Galleries({
    this.id,
    this.productsId,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  Galleries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productsId = json['products_id'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['products_id'] = productsId;
    data['url'] = url;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
