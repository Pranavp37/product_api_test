part of 'products_bloc.dart';

class ProductsEvent {}

class GetAllProducts extends ProductsEvent {}

class GetSingleProducts extends ProductsEvent {
  String id;
  
  GetSingleProducts({required this.id});
}
