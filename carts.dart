import 'dart:convert';

void main() {
  String response = '''
           {
    "carts": [
        {
            "id": 1,
            "products": [
                {
                    "id": 59,
                    "title": "Spring and summershoes",
                    "price": 20,
                    "quantity": 3,
                    "total": 60,
                    "discountPercentage": 8.71,
                    "discountedPrice": 55
                },
                {
                    "id": 88,
                    "title": "TC Reusable Silicone Magic Washing Gloves",
                    "price": 29,
                    "quantity": 2,
                    "total": 58,
                    "discountPercentage": 3.19,
                    "discountedPrice": 56
                },
                {
                    "id": 18,
                    "title": "Oil Free Moisturizer 100ml",
                    "price": 40,
                    "quantity": 2,
                    "total": 80,
                    "discountPercentage": 13.1,
                    "discountedPrice": 70
                },
                {
                    "id": 95,
                    "title": "Wholesale cargo lashing Belt",
                    "price": 930,
                    "quantity": 1,
                    "total": 930,
                    "discountPercentage": 17.67,
                    "discountedPrice": 766
                },
                {
                    "id": 39,
                    "title": "Women Sweaters Wool",
                    "price": 600,
                    "quantity": 2,
                    "total": 1200,
                    "discountPercentage": 17.2,
                    "discountedPrice": 994
                }
            ],
            "total": 2328,
            "discountedTotal": 1941,
            "userId": 97,
            "totalProducts": 5,
            "totalQuantity": 10
        },
        {
            "id": 2,
            "products": [
                {
                    "id": 96,
                    "title": "lighting ceiling kitchen",
                    "price": 30,
                    "quantity": 2,
                    "total": 60,
                    "discountPercentage": 14.89,
                    "discountedPrice": 51
                },
                {
                    "id": 91,
                    "title": "Black Motorbike",
                    "price": 569,
                    "quantity": 3,
                    "total": 1707,
                    "discountPercentage": 13.63,
                    "discountedPrice": 1474
                },
                {
                    "id": 9,
                    "title": "Infinix INBOOK",
                    "price": 1099,
                    "quantity": 1,
                    "total": 1099,
                    "discountPercentage": 11.83,
                    "discountedPrice": 969
                },
                {
                    "id": 16,
                    "title": "Hyaluronic Acid Serum",
                    "price": 19,
                    "quantity": 1,
                    "total": 19,
                    "discountPercentage": 13.31,
                    "discountedPrice": 16
                },
                {
                    "id": 54,
                    "title": "Pubg Printed Graphic T-Shirt",
                    "price": 46,
                    "quantity": 3,
                    "total": 138,
                    "discountPercentage": 16.44,
                    "discountedPrice": 115
                }
            ],
            "total": 3023,
            "discountedTotal": 2625,
            "userId": 30,
            "totalProducts": 5,
            "totalQuantity": 10
        }
    ],
    "total": 20,
    "skip": 0,
    "limit": 2
}
  ''';

  MainProducts mainProducts = MainProducts.fromJson(jsonDecode(response));
  print(mainProducts);
}

class MainProducts {
  int? total;
  int? skip;
  int? limit;
  List<CardProducts> cardProducts;
  MainProducts({
    required this.cardProducts,
    this.total,
    this.skip,
    this.limit,
  });
  factory MainProducts.fromJson(Map<String, Object?> json) => MainProducts(
        cardProducts: (json["cardProducts"] as List?)
                ?.map((e) => CardProducts.fromJson(e))
                .toList() ??
            [],
        total: json["total"] as int?,
        skip: json["skip"] as int?,
        limit: json["limit"] as int?,
      );

  @override
  String toString() {
    return '$runtimeType(total: $total, skip: $skip, limit: $limit, cardProducts: $cardProducts)';
  }
}

class CardProducts {
  int? id;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;
  List<Products> products;
  CardProducts({
    required this.products,
    this.id,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory CardProducts.fromJson(Map<String, Object?> json) => CardProducts(
        id: json["id"] as int,
        products: json["products"] != null
            ? (json["products"] as dynamic)
                .map((e) => e as List<dynamic>)
                .toList()
            : [],
        total: json["total"] as int?,
        discountedTotal: json["discountedTotal"] as int?,
        userId: json["userId"] as int?,
        totalProducts: json["totalProducts"] as int?,
        totalQuantity: json["totalQuantity"] as int?,
      );

  @override
  String toString() {
    return '$runtimeType(id: $id, total: $total, discountedTotal: $discountedTotal, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity, products: $products)';
  }
}

class Products {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;

  Products({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
  });

  factory Products.fromJson(Map<String, Object?> json) => Products(
        id: json["id"] as int?,
        title: json["title"] as String?,
        price: json["price"] as int?,
        quantity: json["quantity"] as int?,
        total: json["total"] as int?,
        discountPercentage: json["discountPercentage"] as double?,
        discountedPrice: json["discountedPrice"] as int?,
      );

  @override
  String toString() {
    return '$runtimeType(id: $id, title: $title, price: $price, quantity: $quantity, total: $total, discountPercentage: $discountPercentage, discountedPrice: $discountedPrice)';
  }
}
