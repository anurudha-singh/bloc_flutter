import 'package:bloc_flutter/bloc/product_bloc.dart';
import 'package:bloc_flutter/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    // MultiBlocProvider(
    // providers: [BlocProvider(create: (_) => ProductBloc())],
    // child:
    MyApp(),
    // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(ProductLoadedEvent()),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen()),
    );
  }
}