import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/cost_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/subdistrict_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/trancking_respon_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';

class RajaOngkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/province');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );

    if (response.statusCode == 200) {
      return right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return left('Erorr');
    }
  }

  // city by province
  Future<Either<String, CityResponseModel>> getCitiesByProvince(
      String provinceId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(CityResponseModel.fromJson(response.body));
    } else {
      return left('Erorr');
    }
  }

  // district by city
  Future<Either<String, SubdistrictResponseModel>> getSubdistrictByCity(
      String cityId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(SubdistrictResponseModel.fromJson(response.body));
    } else {
      return left('Erorr');
    }
  }

  // COST biaya pengiriman
  // String sebelah kiri untuk kembalian gagal & kanan untuk berhasil
  Future<Either<String, CostResponseModel>> getCost(
      String origin, String destination, String courier) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/cost');
    final response = await http.post(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': '1000',
        'courier': courier,
      },
    );

    if (response.statusCode == 200) {
      return right(CostResponseModel.fromJson(response.body));
    } else {
      return left('Erorr');
    }
  }

  // tracking
  Future<Either<String, TrackingResponModel>> getWaybill(
      String courier, String waybill) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/waybill');
    final response = await http.post(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
      body: {
        'waybill': waybill,
        'courier': courier,
      },
    );

    if (response.statusCode == 200) {
      return right(TrackingResponModel.fromJson(response.body));
    } else {
      return left('Erorr');
    }
  }
}
