// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/order_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/order_detail_respon_model.dart';

part 'order_detail_bloc.freezed.dart';
part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OrderDetailBloc(
    this.orderRemoteDatasource,
  ) : super(_Initial()) {
    on<_GetOrderDetail>((event, emit) async {
      emit(_Loading());
      final result = await orderRemoteDatasource.getOrderById(event.orderId);
      result.fold(
        (l) => emit(_Erorr('Erorr')),
        (r) => emit(_Loaded(r.order!)),
      );
    });
  }
}
