import 'package:bloc_flutter/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Failed to load Image data');
    }
  }
}
