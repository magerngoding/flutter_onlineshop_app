// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';

import '../../../../data/models/responses/subdistrict_response_model.dart';

part 'subdistrict_bloc.freezed.dart';
part 'subdistrict_event.dart';
part 'subdistrict_state.dart';

class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  final RajaOngkirRemoteDatasource rajaOngkirRemoteDatasource;
  SubdistrictBloc(
    this.rajaOngkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetSubdistrict>((event, emit) async {
      emit(_Loading());
      final respose =
          await rajaOngkirRemoteDatasource.getSubdistrictByCity(event.cityId);
      respose.fold(
        (l) => emit(_Erorr(l)),
        (r) => emit(_Loaded(r.rajaongkir!.results ?? [])),
      );
    });
  }
}
