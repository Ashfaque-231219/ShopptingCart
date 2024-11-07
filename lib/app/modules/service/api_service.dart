import 'package:dio/dio.dart';

import '../model/product_list_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<ProductList>> fetchProducts() async {
    try {
      final response = await _dio.get('https://api.escuelajs.co/api/v1/products');
      if (response.statusCode == 200) {
        List data = response.data as List;
        return data.map((json) => ProductList.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching products: $e');
    }
  }
}
