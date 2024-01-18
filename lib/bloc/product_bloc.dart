import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/model/product_model.dart';
import 'package:bloc_flutter/repo/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo productRepo;
  ProductBloc(this.productRepo) : super(ProductblocInitial()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        print('line 14 ${state}');
        var data = await productRepo.getProducts();

        emit(ProductLoadedState(data));
      } catch (e) {
        emit(ProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}
