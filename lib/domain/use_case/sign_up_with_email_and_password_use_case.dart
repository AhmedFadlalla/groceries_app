import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

class SignUpWithEmailAndPasswordUseCase extends BaseUseCase<void,UserParameter>{
  final BaseAppRepository baseAppRepository;


  SignUpWithEmailAndPasswordUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(UserParameter parameter) async{
    return await baseAppRepository.signUpWithEmailAndPassword(parameter);
  }

}