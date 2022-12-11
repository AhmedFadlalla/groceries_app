import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';
import 'package:grocery_app/presentation/controller/counter/search_state.dart';
import 'package:meta/meta.dart';

import '../../../core/services/dio_helper.dart';
import '../../../core/utils/constrant.dart';
import '../../../core/utils/end_point.dart';
import '../../../data/models/product_data_model.dart';
import '../../../domain/use_case/search_product_by_name_use_case.dart';
import '../../screens/component/compenent.dart';

class SearchCubit extends Cubit<SearchState> {
   // final SearchProductByNameUseCase searchProductByNameUseCase;
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context)=>BlocProvider.of(context);

   List<BaseProductData> searchProducts=[];

   void getSearchProductData({
  required String name
}) async {
     emit(GetSearchDataLoadingState());
      await DioHelper.getData(url: searchByProductName(name),
         token: uId,
      ).then((value) {
       for(var i in value.data["data"]["data"]){
         searchProducts.add(ProductDataModel.fromJson(i));
       }
       print("Listttttttttttttttttt:$searchProducts");
       emit(GetSearchDataSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(GetSearchDataErrorState(error.toString()));
     });
   }
}
