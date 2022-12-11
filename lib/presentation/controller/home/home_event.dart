import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseHomeEvent extends Equatable{

  const BaseHomeEvent();
  @override
  List<Object?> get props => [];
}
class GetCategoriesEvent extends BaseHomeEvent{}

class GetProductsDataByCategoryEvent extends BaseHomeEvent{
  final int id;

 const  GetProductsDataByCategoryEvent({required this.id});
}
class GetProductDetailsDataEvent extends BaseHomeEvent{
  final int id;

  const  GetProductDetailsDataEvent({required this.id});
}
class SearchProductByNameEvent extends BaseHomeEvent{
  final String name;
  const SearchProductByNameEvent({required this.name});
}
