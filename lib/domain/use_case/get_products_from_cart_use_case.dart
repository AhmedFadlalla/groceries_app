import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

import '../entities/base_cart_product_data.dart';

class GetProductsFromCartUseCase extends BaseUseCase<List<BaseCartProductData>,NoParameters>{
  final BaseAppRepository baseAppRepository;

  GetProductsFromCartUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseCartProductData>>> call(NoParameters parameter) async{
    return await baseAppRepository.getProductsFromCart();
  }

}