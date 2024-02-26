// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';

import '../../../../data/models/responses/province_response_model.dart';

part 'province_bloc.freezed.dart';
part 'province_event.dart';
part 'province_state.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final RajaOngkirRemoteDatasource rajaOngkirRemoteDatasource;
  ProvinceBloc(
    this.rajaOngkirRemoteDatasource,
  ) : super(_Initial()) {
    on<_GetProvinces>((event, emit) async {
      emit(_Loading());
      final respose = await rajaOngkirRemoteDatasource.getProvinces();
      respose.fold(
        (l) => emit(_Erorr(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results ?? [])),
      );
    });
  }
}
