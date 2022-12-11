import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/exceptions.dart';
import 'package:grocery_app/core/network/error_message_model.dart';
import 'package:grocery_app/core/services/dio_helper.dart';
import 'package:grocery_app/core/utils/app_constant.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/data/models/auth_data_model.dart';
import 'package:grocery_app/data/models/user_data_model.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';
import '../../core/utils/end_point.dart';
import '../models/cart_product_data_model.dart';
import '../models/category_data_model.dart';
import '../models/order_data_model.dart';
import '../models/product_data_model.dart';

abstract class BaseRemoteDataSource {
  Future<void> signUpWithEmailAndPassword(UserParameter parameter);
  Future<AuthDataModel> signInWithEmailAndPassword(UserParameter parameter);
  Future<void> logout();
  Future<UserDataModel> getProfileData();
  Future<List<CategoryDataModel>> getCategoriesData();
  Future<List<ProductDataModel>> getProductsDataByCategory(StatusParameter parameter);
  Future<ProductDataModel> getProductDetailsData(StatusParameter parameter);
  Future<void> addProductToCart(StatusParameter parameter);
  Future<List<CartProductDataModel>> getProductsFromCart();
  Future<List<ProductDataModel>> searchProductByName(SearchStatus parameter);
  Future<void> addProductToFavourite(StatusParameter parameter);
  Future<OrderDataModel> sendOrderData(OrderParameter parameter);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<void> signUpWithEmailAndPassword(UserParameter parameter) async {
    final response = await DioHelper.postData(url: register, data: {
      "email": parameter.email,
      "password": parameter.password,
      "name": parameter.name
    });

    if (response.statusCode == 200) {
      print("Register Successfully");
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<AuthDataModel> signInWithEmailAndPassword(UserParameter parameter) async {
    final response = await DioHelper.postData(
        url: login,
        data: {"email": parameter.email, "password": parameter.password});
    if (response.statusCode == 200) {
      print(response.data["data"]);
      return AuthDataModel.fromJson(response.data);
    } else if (response.statusCode == 400) {
      throw WrongDataException(
          wrongDataModel: WrongDataModel.fromJson(response.data));
    } else if (response.statusCode == 500) {
      throw WrongDataException(
          wrongDataModel: WrongDataModel.fromJson(response.data));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<void> logout() async {
    print(uId);
    final response = await DioHelper.postData(url: logoutPoint, token: uId);
    print(response.data);
    if (response.statusCode == 200) {
      print("Successfully logged out");
    } else {
      ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<List<CategoryDataModel>> getCategoriesData() async {
    final response = await DioHelper.getData(url: categories, token: uId);
    if (response.statusCode == 200) {
      print(response.data);
      return List<CategoryDataModel>.from(
          (response.data["data"]["data"] as List)
              .map((e) => CategoryDataModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<List<ProductDataModel>> getProductsDataByCategory(StatusParameter parameter) async {
    if (parameter.id == 0) {
      final response = await DioHelper.getData(url: products, token: uId);
      if (response.statusCode == 200) {
        return List<ProductDataModel>.from(
            (response.data["data"]["data"] as List)
                .map((e) => ProductDataModel.fromJson(e)));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    } else {
      final response = await DioHelper.getData(
          url: getProductsByCategory(parameter.id), token: uId);
      if (response.statusCode == 200) {
        return List<ProductDataModel>.from(
            (response.data["data"]["data"] as List)
                .map((e) => ProductDataModel.fromJson(e)));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }
  @override
  Future<ProductDataModel> getProductDetailsData(StatusParameter parameter) async {
    final response = await DioHelper.getData(
        url: getProductDetails(parameter.id), token: uId);
    if (response.statusCode == 200) {
      return ProductDataModel.fromJson(response.data["data"]);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<void> addProductToCart(StatusParameter parameter) async {
    final response = await DioHelper.postData(
        url: addProductToCartEndPoint(parameter.id), token: uId);
    print(response.data);
    if (response.statusCode == 200) {
      print("Added Successfully");
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<List<CartProductDataModel>> getProductsFromCart() async {
    final response = await DioHelper.getData(url: cart, token: uId);
    print(response.data);
    if (response.statusCode == 200) {
      return List<CartProductDataModel>.from((response.data["data"] as List)
          .map((e) => CartProductDataModel.fromJson(e)));
    } else {
      ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
      return [];
    }
  }
  @override
  Future<List<ProductDataModel>> searchProductByName(SearchStatus parameter) async {
    final response =
        await DioHelper.getData(url: searchByProductName(parameter.name), token: uId);
    print('herooooooooooo');
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
        if(response.data["data"]==[]){
          showToast(text: "No Data Avaiable", state: ToastStates.SUCCESS);
          return List<ProductDataModel>.from((response.data["data"] as List)
              .map((e) => ProductDataModel.fromJson(e)));
        }else{
          print('Get Data here');
          List<ProductDataModel> products = [];
          for(var i in response.data["data"]["data"]){
            products.add(ProductDataModel.fromJson(i));
          }
          print(products.length);
          print(products[0].name);
          return products;
          return List<ProductDataModel>.from((response.data["data"]["data"] as List)
              .map((e) => ProductDataModel.fromJson(e)));
        }


    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<UserDataModel> getProfileData() async{
    final response =
    await DioHelper.getData(url: profile,token: uId);
    print(response.data);
    if (response.statusCode == 200) {
      return UserDataModel.fromJson(response.data["data"]);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  @override
  Future<void> addProductToFavourite(StatusParameter parameter) async{
    final response = await DioHelper.postData(
        url: addProductToCartEndPoint(parameter.id), token: uId);
    print(response.data);
    if (response.statusCode == 200) {
      print("Added Successfully");
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<OrderDataModel> sendOrderData(OrderParameter parameter) async{
    final response = await DioHelper.postData(
      data: {
        "name":parameter.name,
        "email":parameter.email,
        "address":parameter.address,
        "city":parameter.city,
        "phone":parameter.phone
      },
        url: orderData, token: uId);
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == 200 && response.data['code'] == 202) {
      return OrderDataModel.fromJson(response.data["data"]);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
