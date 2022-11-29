import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/domain/entities/base_category_data.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

class GetCategoriesDataUseCase extends BaseUseCase<List<BaseCategoryData>,NoParameters>{
  final BaseAppRepository baseAppRepository;


  GetCategoriesDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseCategoryData>>> call(NoParameters parameter)async {
    return await baseAppRepository.getCategoriesData();
  }

}