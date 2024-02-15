import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  Future<Either<String, ProductResponseModel>> getAllProducts() async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/products'),
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Erorr');
    }
  }

  Future<Either<String, ProductResponseModel>> getAllProductsByCategory(
      int caregoryId) async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/products?category_id=$caregoryId'),
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Erorr');
    }
  }
}
