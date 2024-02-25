// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/address_remote_datasource.dart';

import '../../../../data/models/responses/address_response_model.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRemoteDataSource addressRemoteDataSource;
  AddressBloc(
    this.addressRemoteDataSource,
  ) : super(_Initial()) {
    on<_GetAddresses>((event, emit) async {
      //async untuk aksess ke BE
      emit(_Loading());
      final response = await addressRemoteDataSource.getAddresses();
      response.fold(
        (l) => emit(_Erorr(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
