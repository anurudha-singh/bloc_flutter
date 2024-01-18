import 'package:bloc_flutter/bloc/product_bloc.dart';
import 'package:bloc_flutter/repo/product_repo.dart';
import 'package:bloc_flutter/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    // MultiBlocProvider(
    // providers: [BlocProvider(create: (_) => ProductBloc())],
    // child:
    RepositoryProvider(
      create: (context) =>
          ProductRepo(), // Calling repo from here help us to maintain the syncing of the data
      child: const MyApp(),
    ),
    // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => ProductBloc()..add(ProductLoadedEvent()),
      create: (context) => ProductBloc(
          ProductRepo()), // Hence we have added the event in the same UI class which is Product Screen here hence we don't need to add the events from here.
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen()),
    );
  }
}
