import 'package:equatable/equatable.dart';

abstract class BaseCartEvent extends Equatable {
  const BaseCartEvent();
  @override
  List<Object?> get props => [];

}
class AddProductToCartEvent extends BaseCartEvent{
  final int id;

   const AddProductToCartEvent(this.id);
}
class GetProductsFromCartEvent extends BaseCartEvent{}
class IncreaseCountEvent extends BaseCartEvent{
}

