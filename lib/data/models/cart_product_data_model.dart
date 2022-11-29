import 'package:grocery_app/domain/entities/base_cart_product_data.dart';

class CartProductDataModel extends BaseCartProductData {
  const CartProductDataModel(
      {required super.id, required super.name, required super.image, required super.quantity, required super.price, required super.offer});

  factory CartProductDataModel.fromJson(Map<String, dynamic> json)=>
      CartProductDataModel(id: json["id"],
          name: json["name"] ,
          image:json["image"] ,
          quantity: json["quantity"],
          price:json["price"] ,
          offer:json["offer"] );

}