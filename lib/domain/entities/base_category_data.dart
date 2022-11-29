import 'package:equatable/equatable.dart';

class BaseCategoryData extends Equatable {
  final int id;
  final String name;

  const BaseCategoryData({
  required  this.id,
  required  this.name,
  });

  @override
  List<Object?> get props => [
    id,name
  ];


}
