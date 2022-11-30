import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/utils/app_constant.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/domain/entities/base_auth_data.dart';
import 'package:grocery_app/domain/entities/base_category_data.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';
import 'package:grocery_app/domain/entities/base_user_data.dart';

import '../entities/base_cart_product_data.dart';
abstract class BaseAppRepository {

  Future<Either<Failure,void>> signUpWithEmailAndPassword(UserParameter parameter);
  Future<Either<Failure,BaseAuthData>> signInWithEmailAndPassword(UserParameter parameter);
  Future<Either<Failure,BaseUserData>> getProfileData();
  Future<Either<Failure,void>> logout();
  Future<Either<Failure,List<BaseCategoryData>>> getCategoriesData();
  Future<Either<Failure,List<BaseProductData>>> getProductsDataByCategory(StatusParameter parameter);
  Future<Either<Failure,BaseProductData>> getProductDetailsData(StatusParameter parameter);
  Future<Either<Failure,void>> addProductToCart(StatusParameter parameter);
  Future<Either<Failure,List<BaseCartProductData>>> getProductsFromCart();
  Future<Either<Failure,List<BaseProductData>>> searchProductByName(SearchStatus parameter);
  // Future<Either<Failure,void>> addProductToFavourite(StatusParameter parameter);



}