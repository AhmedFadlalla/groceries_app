import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/core/use_case/base_use_case.dart';
import 'package:grocery_app/core/utils/constrant.dart';
import 'package:grocery_app/domain/repo/base_app_repo.dart';

import '../entities/base_order_data.dart';

class SendOrderDataUseCase extends BaseUseCase<BaseOrderData,OrderParameter>{
  final BaseAppRepository baseAppRepository;


  SendOrderDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure,BaseOrderData>> call(OrderParameter parameter) async{
    return await baseAppRepository.sendOrderDataData(parameter);
  }

}