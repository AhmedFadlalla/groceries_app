import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/utils/enum.dart';
import 'package:grocery_app/domain/entities/base_product_data.dart';

import '../../../domain/entities/base_category_data.dart';

class HomeState extends Equatable{

  final List<BaseCategoryData> categoriesData;
  final RequestState categoriesDataState;
  final String categoriesDataMessage;
  final List<BaseProductData> productsData;
  final RequestState productsDataState;
  final String productsDataMessage;
  final BaseProductData? productDetailsData;
  final RequestState productDetailsState;
  final String productDetailsMessage;
  final List<BaseProductData> searchProductsData;
  final RequestState searchProductsDataState;
  final String searchProductsDataMessage;



  const  HomeState(
      {this.categoriesData=const [],
      this.categoriesDataState=RequestState.loading,
      this.categoriesDataMessage='',
        this.productsData=const [],
        this.productsDataState=RequestState.loading,
        this.productsDataMessage='',
        this.productDetailsData,
        this.productDetailsState=RequestState.loading,
        this.productDetailsMessage='',
        this.searchProductsData=const [],
        this.searchProductsDataState=RequestState.loading,
        this.searchProductsDataMessage=''
      });

  HomeState copyWith({
     List<BaseCategoryData>? categoriesData,
     RequestState? categoriesDataState,
     String? categoriesDataMessage,
    List<BaseProductData>? productsData,
    RequestState? productsDataState,
    String? productsDataMessage,
    BaseProductData? productDetailsData,
    RequestState? productDetailsState,
    String? productDetailsMessage,
    List<BaseProductData>? searchProductsData,
    RequestState? searchProductsDataState,
    String? searchProductsDataMessage,
})=>HomeState(
    categoriesData: categoriesData??this.categoriesData,
    categoriesDataState: categoriesDataState??this.categoriesDataState,
    categoriesDataMessage: categoriesDataMessage??this.categoriesDataMessage,
    productsData: productsData??this.productsData,
    productsDataState: productsDataState??this.productsDataState,
    productsDataMessage: productsDataMessage??this.productsDataMessage,
    productDetailsData: productDetailsData??this.productDetailsData,
    productDetailsState: productDetailsState??this.productDetailsState,
    productDetailsMessage: productDetailsMessage??this.productDetailsMessage,
    searchProductsData: searchProductsData??this.searchProductsData,
    searchProductsDataState: searchProductsDataState??this.searchProductsDataState,
    searchProductsDataMessage: searchProductsDataMessage??this.searchProductsDataMessage
      );


  @override
  List<Object?> get props => [
    categoriesData,categoriesDataState,categoriesDataMessage,
    productsData,productsDataState,productsDataMessage,
    productDetailsData,productDetailsState,productDetailsMessage,
    searchProductsData,searchProductsDataState,searchProductsDataMessage
  ];

}
