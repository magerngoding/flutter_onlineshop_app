import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'best_seller_product_event.dart';
part 'best_seller_product_state.dart';
part 'best_seller_product_bloc.freezed.dart';

class BestSellerProductBloc
    extends Bloc<BestSellerProductEvent, BestSellerProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  BestSellerProductBloc(
    this._productRemoteDataSource,
  ) : super(_Initial()) {
    on<_GetBestSellerProducts>((event, emit) async {
      final response =
          await _productRemoteDataSource.getAllProductsByCategory(1);
      response.fold(
        (l) => emit(BestSellerProductState.erorr('Internal Server Erorr')),
        (r) => emit(BestSellerProductState.loaded(r.data!.data!)),
      );
    });
  }
}
