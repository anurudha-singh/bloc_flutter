import 'package:bloc_flutter/screen/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: TextButton(
              child: const Text(
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
