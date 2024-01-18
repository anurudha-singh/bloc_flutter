import 'package:bloc_flutter/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context
        .read<ProductBloc>()
        .add(ProductLoadedEvent()); // we have added a Loaded event  the bloc
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    if (productBloc != Null) print('product bloc init correctly');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Product Screen'),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
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
