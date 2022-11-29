import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

import '../../core/use_case/base_use_case.dart';

class AddProductToCartUseCase  extends BaseUseCase<void,StatusParameter>{
  final BaseAppRepository baseAppRepository;


  AddProductToCartUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(StatusParameter parameter)async {
   return await baseAppRepository.addProductToCart(parameter);
  }

}