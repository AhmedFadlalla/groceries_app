import '../../domain/entities/base_order_data.dart';

class OrderDataModel extends BaseOrderData {
  const OrderDataModel(
      {required super.id, required super.name, required super.email, required super.address, required super.phone, required super.city, required super.orderProducts, required super.totalPrice});


  factory OrderDataModel.fromJson(Map<String, dynamic>json){
    return OrderDataModel(
        id:json["id"] ,
        name:json["name"]  ,
        email:json["email"] ,
        address:json["address"] ,
        phone:json["phone"] ,
        city:json["city"] ,
        orderProducts:json["order_products"] ,
        totalPrice:json["total_price"] );
  }
}