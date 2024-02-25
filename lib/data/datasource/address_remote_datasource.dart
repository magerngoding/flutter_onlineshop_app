// ignore_for_file: prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';
import 'package:http/http.dart' as http;

class AddressRemoteDataSource {
  Future<Either<String, AddressResponseModel>> getAddresses() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/addresses'),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return Right(AddressResponseModel.fromJson(response.body));
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }
}
