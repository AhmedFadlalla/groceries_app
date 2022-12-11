

import 'package:get_it/get_it.dart';
import 'package:grocery_app/data/data_source/base_remote_data_source.dart';
import 'package:grocery_app/domain/use_case/get_categories_data_use_case.dart';
import 'package:grocery_app/domain/use_case/send_order_data_use_case.dart';
import 'package:grocery_app/presentation/controller/counter/search_cubit.dart';
import 'package:grocery_app/presentation/controller/home/home_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:grocery_app/presentation/controller/register/auth_bloc.dart';


import '../../data/repo/app_repo.dart';
import '../../domain/repo/base_app_repo.dart';
import '../../domain/use_case/add_product_to_cart_use_case.dart';
import '../../domain/use_case/get_prodfile_data_use_case.dart';
import '../../domain/use_case/get_product_details_data_use_case.dart';
import '../../domain/use_case/get_products_data_by_category_use_case.dart';
import '../../domain/use_case/get_products_from_cart_use_case.dart';
import '../../domain/use_case/logout_use_case.dart';
import '../../domain/use_case/search_product_by_name_use_case.dart';
import '../../domain/use_case/sign_in_with_email_and_password_use_case.dart';
import '../../domain/use_case/sign_up_with_email_and_password_use_case.dart';
import '../../presentation/controller/cart/cart_bloc.dart';
import '../../presentation/controller/order/order_bloc.dart';



final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
    sl.registerLazySingleton<AuthBloc>(() =>AuthBloc(sl(),sl(),sl(),sl()));
    sl.registerFactory<HomeBloc>(() =>HomeBloc(sl(),sl(),sl()));
    sl.registerFactory<CartBloc>(() =>CartBloc(sl(),sl()));
    sl.registerFactory<OrderBloc>(() =>OrderBloc(sl()));
    sl.registerFactory<SearchCubit>(() =>SearchCubit());
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case
    sl.registerLazySingleton<SignUpWithEmailAndPasswordUseCase>(() =>SignUpWithEmailAndPasswordUseCase(sl()) );
    sl.registerLazySingleton<SignInWithEmailAndPasswordUseCase>(() =>SignInWithEmailAndPasswordUseCase(sl()) );
    sl.registerLazySingleton<GetCategoriesDataUseCase>(() =>GetCategoriesDataUseCase(sl()) );
    sl.registerLazySingleton<GetProductsDataByCategoryUseCase>(() =>GetProductsDataByCategoryUseCase(sl()) );
    sl.registerLazySingleton<GetProductDetailsDataUseCase>(() =>GetProductDetailsDataUseCase(sl()) );
    sl.registerLazySingleton<AddProductToCartUseCase>(() =>AddProductToCartUseCase(sl()) );
    sl.registerLazySingleton<GetProductsFromCartUseCase>(() =>GetProductsFromCartUseCase(sl()) );
    sl.registerLazySingleton<LogoutUseCase>(() =>LogoutUseCase(sl()));
    sl.registerLazySingleton<SearchProductByNameUseCase>(() =>SearchProductByNameUseCase(sl()));
    sl.registerLazySingleton<GetProfileDataUseCase>(() =>GetProfileDataUseCase(sl()));
    sl.registerLazySingleton<SendOrderDataUseCase>(() =>SendOrderDataUseCase(sl()));


    //Repository
    sl.registerLazySingleton<BaseAppRepository>(() =>AppRepository(sl()));
    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() =>RemoteDataSource());
  }

}