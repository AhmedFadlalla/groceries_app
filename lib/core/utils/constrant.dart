import 'package:equatable/equatable.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';

import '../../data/models/product_data_model.dart';

class UserParameter extends Equatable{
   final String name ;
   final  String email;
   final String password;


   UserParameter({
     required this.name,
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,password];

}

class TaskParameter extends Equatable{
int? taskId;
  final String title;
  final String description;
  final String imagePath;
  final String imageName;
  final String? voice;
  final String startDate;
  final String endDate;


  TaskParameter(
      {
        this.taskId,
        required this.title,
        required this.description,
        required this.imagePath,
        required this.imageName,
         this.voice,
        required this.startDate,
        required this.endDate,
       });

  @override
  // TODO: implement props
  List<Object?> get props => [taskId,title,description,imagePath,imageName,voice,startDate,endDate];

}
class SearchStatus extends Equatable{
  final String name;

  const SearchStatus({
    required this.name});

  @override
  List<Object?> get props => [
    name
  ];

}
class StatusParameter extends Equatable{
  final String? name ;
  final int id;


  StatusParameter({
     this.name,
    required this.id

  });

  @override
  // TODO: implement props
  List<Object?> get props => [name];

}
class OrderParameter extends Equatable{
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String city;
  final List<BaseProductData> orderProducts;
  final double totalPrice;

  const  OrderParameter({
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
String? uId;
