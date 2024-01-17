import 'package:bloc_flutter/bloc/product_bloc.dart';
import 'package:bloc_flutter/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Bloc'),
        ),
        body: Center(
          child: TextButton(
              child: Text(
                'Show Data',
                style: TextStyle(fontSize: 25),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProductScreen();
                }));
              }),
        ));
  }
}
