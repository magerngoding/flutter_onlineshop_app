import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/models/responses/caregory_respose_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDataSource {
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/categories'),
    );

    if (response.statusCode == 200) {
      return Right(CategoryResponseModel.fromJson(response.body));
    } else {
      return Left('Internal Server Erorr');
    }
  }
}
