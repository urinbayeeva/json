import 'dart:convert';

void main() {
  String respons = '''
                  {
    "products": [
        {
            "id": 1,
            "title": "iPhone 9",
            "description": "An apple mobile which is nothing like apple",
            "price": 549,
            "discountPercentage": 12.96,
            "rating": 4.69,
            "stock": 94,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/1/1.jpg",
                "https://i.dummyjson.com/data/products/1/2.jpg",
                "https://i.dummyjson.com/data/products/1/3.jpg",
                "https://i.dummyjson.com/data/products/1/4.jpg",
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
            ]
        },
        {
            "id": 2,
            "title": "iPhone X",
            "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            "price": 899,
            "discountPercentage": 17.94,
            "rating": 4.44,
            "stock": 34,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail": "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
            "images": [
                "https://i.dummyjson.com/data/products/2/1.jpg",
                "https://i.dummyjson.com/data/products/2/2.jpg",
                "https://i.dummyjson.com/data/products/2/3.jpg",
                "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
            ]
        }
    ],
    "total": 100,
    "skip": 0,
    "limit": 2
}
  ''';

     MainProdut mainProdut = MainProdut.fromJson(jsonDecode(respons));
     print(mainProdut);
}

class MainProdut {
  List<ProductName> products;
  int? total;
  int? skip;
  int? limit;

  MainProdut({
   required this.products,
    this.total,
    this.skip,
    this.limit,
  });
  factory MainProdut.fromJson(Map<String,Object?>json) => MainProdut(
  products: (json["products"] as List?)?.map((e) => ProductName.fromJson(e)).toList() ?? [],
  total: json["total"] as int?,
  skip: json["skip"]as int?,   
  limit:json["limit"] as int?,
  );

  @override
  String toString() {
    return 'MainProdut(products: $products, total: $total, skip: $skip, limit: $limit)';
  }
}

class ProductName {
  int? id;
  String? title;
  List<String>? images;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  double? discountPercentage;
  String? description;
  int? price;

  ProductName({
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.discountPercentage,
    this.description,
    this.price,
    this.id,
    this.title,
    required this.images,
  });
  factory ProductName.fromJson(Map<String, Object?> json) => ProductName(
        rating: json["rating"] as double?,
        stock: json["stock"] as int?,
        brand: json["brand"] as String?,
        category: json["category"] as String?,
        thumbnail: json["thumbnail"] as String?,
        discountPercentage: json["discountPercentage"] as double?,
        description: json["description"] as String?,
        price: json["price"] as int?,
        id: json["id"] as int?,
        title: json["title"] as String?,
        images: (json["images"] != null)
            ? (json["images"] as List).map((e) => e as String).toList()
            : [],
      );

  @override
  String toString() {
    return 'ProductName(images: $images, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, discountPercentage: $discountPercentage, description: $description, price: $price, id: $id, title: $title)';
  }
}
