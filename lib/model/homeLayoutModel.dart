

/* class HomeModel {
  bool status;
  Null message;
  Data data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Banners> banners;
  List<Products> products;
  String ad;

  Data({this.banners, this.products, this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['ad'] = this.ad;
    return data;
  }
}

class Banners {
  int id;
  String image;
  Category category;
  Null product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['product'] = this.product;
    return data;
  }
}

class Category {
  int id;
  String image;
  String name;

  Category({this.id, this.image, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class Products {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Products(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }
} */







// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  dynamic message;
  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.banners,
    this.products,
    this.ad,
  });

  List<Banner> banners;
  List<Product> products;
  String ad;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    ad: json["ad"],
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "ad": ad,
  };
}

class Banner {
  Banner({
    this.id,
    this.image,
    this.category,
    this.product,
  });

  int id;
  String image;
  Category category;
  dynamic product;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    image: json["image"],
    category: Category.fromJson(json["category"]),
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category.toJson(),
    "product": product,
  };
}

class Category {
  Category({
    this.id,
    this.image,
    this.name,
  });

  int id;
  String image;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
  };
}

class Product {
  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"].toDouble(),
    oldPrice: json["old_price"].toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}

