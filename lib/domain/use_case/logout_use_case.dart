import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

import '../../core/utils/constrant.dart';
import '../entities/base_auth_data.dart';

class LogoutUseCase extends BaseUseCase<void,NoParameters>{
  final BaseAppRepository baseAppRepository;

  LogoutUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameter)async {
    return await baseAppRepository.logout();
  }
}