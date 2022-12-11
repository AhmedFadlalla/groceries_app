import 'package:equatable/equatable.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';

abstract class BaseOrderEvent extends Equatable {
  const BaseOrderEvent();
  @override
  List<Object?> get props => [];

}
class SendOrderDataEvent extends BaseOrderEvent{

  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String city;
  final List<BaseProductData> orderProducts;
  final double totalPrice;

  const  SendOrderDataEvent({
    required this.id,
    required  this.name,
    required  this.email,
    required  this.address,
    required  this.phone,
    required  this.city,
    required  this.orderProducts,
    required  this.totalPrice,
  });

}
