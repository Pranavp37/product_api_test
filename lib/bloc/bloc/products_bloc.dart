import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_test/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:product_api_test/model/single_product_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetAllProducts>((event, emit) async {
      emit(ProductsLoading());
      try {
        var res =
            await http.get(Uri.parse('https://api.restful-api.dev/objects'));
        if (res.statusCode == 200) {
          emit(ProductsSucces(data: productModelFromJson(res.body)));
        }
      } catch (e) {
        emit(ProductsError(error: e.toString()));
      }
    });

    on<GetSingleProducts>(
      (event, emit) async {
        emit(ProductsLoading());
        try {
          var res = await http.get(
              Uri.parse('https://api.restful-api.dev/objects/${event.id}'));
          if (res.statusCode == 200) {
            emit(
              SingleProductsSucces(
                singledata: onesingleModelFromJson(res.body),
              ),
            );
          }
        } catch (e) {
          emit(SingleProductsError(error: e.toString()));
        }
      },
    );
  }
}
