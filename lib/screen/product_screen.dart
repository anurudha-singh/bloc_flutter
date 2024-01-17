import 'package:bloc_flutter/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    if (productBloc != Null) print('product bloc init correctly');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Product Screen'),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            print(
                'current state is ${state}'); //current state is ProductblocInitial()
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductLoadedState) {
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading:
                            Text(state.productModel[index].title.toString()));
                  });
            } else if (state is ProductErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
