import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.messageId,
    this.status,
    this.data,
  });

  String? messageId;
  String? status;
  List<Datum>? data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        messageId: json["message_id"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.cartId,
    this.productId,
    this.userId,
    required this.quantity,
    this.productsName,
    this.price,
    this.productsPhoto,
  });

  int? cartId;
  int? productId;
  int? userId;
  int quantity;
  String? productsName;
  double? price;
  String? productsPhoto;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cartId: json["cart_id"],
        productId: json["product_id"],
        userId: json["user_id"],
        quantity: json["quantity"],
        productsName: json["products_name"],
        price: json["price"],
        productsPhoto: json["products_photo"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "product_id": productId,
        "user_id": userId,
        "quantity": quantity,
        "products_name": productsName,
        "price": price,
        "products_photo": productsPhoto,
      };
}
