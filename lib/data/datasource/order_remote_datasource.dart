import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/order_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel orderRequestModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/order'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}'
      },
      body: orderRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return right(OrderResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  Future<Either<String, String>> checkPaymentStatus(int orderId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/order/status/$orderId'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return right(data['status']);
    } else {
      return left('Error');
    }
  }
}
