// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';

part 'all_product_bloc.freezed.dart';
part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  AllProductBloc(
    this._productRemoteDataSource,
  ) : super(_Initial()) {
    on<_GetAllProducts>((event, emit) async {
      final response = await _productRemoteDataSource.getAllProducts();
      response.fold(
        (l) => emit(AllProductState.erorr('Internal Server Erorr')),
        (r) => emit(AllProductState.loadded(r.data!.data!)),
      );
    });
  }
}
