import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/responses/cost_response_model.dart';

part 'cost_bloc.freezed.dart';
part 'cost_event.dart';
part 'cost_state.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  final RajaOngkirRemoteDatasource rajaongkirRemoteDatasource;
  CostBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCost>((event, emit) async {
      emit(const _Loading());
      final response = await rajaongkirRemoteDatasource.getCost(
        event.origin,
        event.destination,
        'jne',
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
