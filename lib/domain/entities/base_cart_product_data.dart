import 'package:equatable/equatable.dart';

class BaseCartProductData extends Equatable {
  final int id;
  final String name;
  final String image;
  final int quantity, price, offer;

 const  BaseCartProductData({
  required  this.id,
    required  this.name,
    required  this.image,
    required  this.quantity,
    required  this.price,
    required  this.offer,
  });

  @override
  List<Object?> get props => [
    id,name,price,quantity,image,offer
  ];


}
