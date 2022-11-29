import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

class GetProductDetailsDataUseCase extends BaseUseCase<BaseProductData,StatusParameter>{
  final BaseAppRepository baseAppRepository;


  GetProductDetailsDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, BaseProductData>> call(StatusParameter parameter) async{
    return await baseAppRepository.getProductDetailsData(parameter);
  }

}