import 'package:equatable/equatable.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';

class BaseOrderData extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String city;
  final List<dynamic> orderProducts;
  final double totalPrice;

 const  BaseOrderData({
   required this.id,
  required  this.name,
   required  this.email,
   required  this.address,
   required  this.phone,
   required  this.city,
   required  this.orderProducts,
   required  this.totalPrice,
  });

  @override
  List<Object?> get props => [
    id,name,email,phone,address,city,totalPrice,orderProducts
  ];


}
