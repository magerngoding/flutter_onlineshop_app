// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/trancking_respon_model.dart';

part 'tracking_bloc.freezed.dart';
part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final RajaOngkirRemoteDatasource rajaOngkirRemoteDatasource;

  TrackingBloc(
    this.rajaOngkirRemoteDatasource,
  ) : super(_Initial()) {
    on<_GetTracking>((event, emit) async {
      emit(_Loading());
      final response = await rajaOngkirRemoteDatasource.getWaybill(
          event.kurir, event.noResti);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
