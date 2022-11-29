import 'package:grocery_app/domain/entities/base_user_data.dart';

class UserDataModel extends BaseUserData{
  UserDataModel({required super.name, required super.email, required super.address, required super.phone,required super.image});

  factory UserDataModel.fromJson(Map<String,dynamic>json)=>
      UserDataModel(name: json["name"], email: json["email"], address: json["address"]??"", phone: json["phone"]??"",image: json["image"]??"");
}