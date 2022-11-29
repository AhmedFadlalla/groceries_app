
import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/domain/entities/base_auth_data.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

import '../../core/use_case/base_use_case.dart';

class SignInWithEmailAndPasswordUseCase extends BaseUseCase<BaseAuthData,UserParameter>{

  final BaseAppRepository baseAppRepository;

  SignInWithEmailAndPasswordUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, BaseAuthData>> call(UserParameter parameter) async{
   return await baseAppRepository.signInWithEmailAndPassword(parameter);
  }


}