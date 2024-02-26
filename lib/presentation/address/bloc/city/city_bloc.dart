// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';

import '../../../../data/models/responses/city_response_model.dart';

part 'city_bloc.freezed.dart';
part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final RajaOngkirRemoteDatasource rajaOngkirRemoteDatasource;
  CityBloc(
    this.rajaOngkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCity>((event, emit) async {
      emit(_Loading());
      final respose =
          await rajaOngkirRemoteDatasource.getCitiesByProvince(event.provId);
      respose.fold(
        (l) => emit(_Erorr(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results ?? [])),
      );
    });
  }
}
