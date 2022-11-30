import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/domain/entities/base_user_data.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

class GetProfileDataUseCase extends BaseUseCase<BaseUserData,NoParameters>{
  final BaseAppRepository baseAppRepository;
  GetProfileDataUseCase(this.baseAppRepository);
  @override
  Future<Either<Failure, BaseUserData>> call(NoParameters parameter) async{
   return await baseAppRepository.getProfileData();
  }

}