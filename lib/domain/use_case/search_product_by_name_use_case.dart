import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/app_constant.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

import '../../core/utils/constrant.dart';

class SearchProductByNameUseCase extends BaseUseCase<List<BaseProductData>,SearchStatus>{
  final BaseAppRepository baseAppRepository;


  SearchProductByNameUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseProductData>>> call(SearchStatus parameter) {
    return  baseAppRepository.searchProductByName(parameter);
  }

}