// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/category_remote_datasource.dart';

import '../../../../data/models/responses/caregory_respose_model.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDataSource _categoryRemoteDataSource;
  CategoryBloc(
    this._categoryRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      final response = await _categoryRemoteDataSource.getCategories();
      response.fold(
        (l) => emit(
          const CategoryState.erorr(
            'Internal Server Erorr',
          ),
        ),
        (r) => emit(
          CategoryState.loaded(r.data!),
        ),
      );
    });
  }
}
