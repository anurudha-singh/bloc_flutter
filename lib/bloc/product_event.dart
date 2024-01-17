part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductLoadedEvent extends ProductEvent {
  @override
  List<Object> get props => [];
}
