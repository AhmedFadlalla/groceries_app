import 'package:equatable/equatable.dart';

class BaseProductData extends Equatable {
  final int id;
  final String image;
  final String name;
  final int price;
  final int quantity;
  final String description;


  const BaseProductData({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity
  });




  @override
  List<Object?> get props => [
    id,image,name,description,price,quantity
  ];
}
