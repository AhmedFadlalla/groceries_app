import 'package:grocery_app/domain/entities/base_product_data.dart';

class ProductDataModel extends BaseProductData{
 const  ProductDataModel({required super.id, required super.image, required super.name, required super.price, required super.description,required super.quantity});

 factory ProductDataModel.fromJson(Map<String,dynamic>json)=>
     ProductDataModel(id: json["id"], image: json["image"], name: json["name"], price:json["price"] , quantity: json["quantity"],description: json["description"]);
}