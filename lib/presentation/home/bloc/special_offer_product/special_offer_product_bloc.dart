// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';
part 'special_offer_product_event.dart';
part 'special_offer_product_state.dart';
part 'special_offer_product_bloc.freezed.dart';

class SpecialOfferProductBloc
    extends Bloc<SpecialOfferProductEvent, SpecialOfferProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  SpecialOfferProductBloc(
    this._productRemoteDataSource,
  ) : super(_Initial()) {
    on<SpecialOfferProductEvent>((event, emit) async {
      emit(SpecialOfferProductState.loading());
      final response =
          await _productRemoteDataSource.getAllProductsByCategory(6);
      response.fold(
        (l) => emit(SpecialOfferProductState.erorr('Internal Server Erorr')),
        (r) => emit(SpecialOfferProductState.loaded(r.data!.data!)),
      );
    });
  }
}
