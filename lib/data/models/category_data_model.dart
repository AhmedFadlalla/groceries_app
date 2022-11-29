import 'package:grocery_app/domain/entities/base_category_data.dart';

class CategoryDataModel extends BaseCategoryData{
  const CategoryDataModel({required super.id, required super.name});

  factory CategoryDataModel.fromJson(Map<String,dynamic> json)=>
      CategoryDataModel(id: json["id"], name: json["name"]);
}