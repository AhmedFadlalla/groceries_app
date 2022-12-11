import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/utils/app_constant.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/data/data_source/base_remote_data_source.dart';
import 'package:grocery_app/domain/entities/base_auth_data.dart';
import 'package:grocery_app/domain/entities/base_category_data.dart';
import 'package:grocery_app/domain/entities/base_order_data.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';
import 'package:grocery_app/domain/entities/base_user_data.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

import '../models/cart_product_data_model.dart';

class AppRepository extends BaseAppRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  AppRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(UserParameter parameter) async{
    await baseRemoteDataSource.signUpWithEmailAndPassword(parameter);

    try{
      return Right(print("Send Successfully"));
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, BaseAuthData>> signInWithEmailAndPassword(UserParameter parameter) async{
    final result=await baseRemoteDataSource.signInWithEmailAndPassword(parameter);
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async{
    await baseRemoteDataSource.logout();
    try{
      return Right(print("Success"));
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }
  @override
  Future<Either<Failure, List<BaseCategoryData>>> getCategoriesData() async{
    final result=await baseRemoteDataSource.getCategoriesData();
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<BaseProductData>>> getProductsDataByCategory(StatusParameter parameter) async{
    final result=await baseRemoteDataSource.getProductsDataByCategory(parameter);
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, BaseProductData>> getProductDetailsData(StatusParameter parameter) async{
    final result=await baseRemoteDataSource.getProductDetailsData(parameter);
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToCart(StatusParameter parameter) async{
    await baseRemoteDataSource.addProductToCart(parameter);
    try{
      return Right(print("Add Successfully"));
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }
  @override
  Future<Either<Failure, List<CartProductDataModel>>> getProductsFromCart() async{
    final result=await baseRemoteDataSource.getProductsFromCart();
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }
  @override
  Future< List<BaseProductData>> searchProductByName(SearchStatus parameter) async{
    final result=await baseRemoteDataSource.searchProductByName(parameter);
    try{
      return result;
    }on ServerFailure catch(failure){
      throw Left(ServerFailure(failure.message));
    }

  }
  @override
  Future<Either<Failure, BaseUserData>> getProfileData() async{
    final result=await baseRemoteDataSource.getProfileData();
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, BaseOrderData>> sendOrderDataData(OrderParameter parameter) async{
    final result=await baseRemoteDataSource.sendOrderData(parameter);
    try{
      return Right(result);
    }on ServerFailure catch(failure){
      return Left(ServerFailure(failure.message));
    }
  }



}