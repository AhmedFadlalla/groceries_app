import 'package:grocery_app/domain/entities/base_auth_data.dart';

class AuthDataModel extends BaseAuthData{
  const AuthDataModel({required super.token});
  
  factory AuthDataModel.fromJson(Map<String,dynamic>json)=>
      AuthDataModel(token: json["token"]);
}