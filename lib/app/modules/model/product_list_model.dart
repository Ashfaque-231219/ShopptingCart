
class ProductListCategory {


  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  ProductListCategory({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
  ProductListCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    creationAt = json['creationAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class ProductList {


  int? id;
  String? title;
  int? price;
  String? description;
  List<String?>? images;
  String? creationAt;
  String? updatedAt;
  ProductListCategory? category;

  ProductList({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });
  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    price = json['price']?.toInt();
    description = json['description']?.toString();
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
    creationAt = json['creationAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    category = (json['category'] != null) ? ProductListCategory.fromJson(json['category']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    if (images != null) {
      final v = images;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['images'] = arr0;
    }
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}
