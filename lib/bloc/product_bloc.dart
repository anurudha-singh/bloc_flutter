import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductblocInitial()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        print('inside try block');
        emit(ProductLoadingState());
        print('line 14 ${state}');
        var response = await http
            .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
        print('this is my response');
        print(response.body);
        if (response.statusCode == 200) {
          emit(ProductLoadedState(productModelFromJson(response.body)));
        } else {
          print('failed to emit the state');
          throw Exception('Failed to load Image data');
        }
      } catch (e) {
        emit(ProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}
