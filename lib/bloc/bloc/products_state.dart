part of 'products_bloc.dart';

class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSucces extends ProductsState {
  List<ProductModel>? data = [];
  SingleModel? singledata;
  ProductsSucces({this.data, this.singledata});
}

final class ProductsError extends ProductsState {
  String error;
  ProductsError({required this.error});
}

final class SingleProductsSucces extends ProductsState {
  SingleModel? singledata;
  SingleProductsSucces({this.singledata});
}

final class SingleProductsError extends ProductsState {
  String error;
  SingleProductsError({required this.error});
}
