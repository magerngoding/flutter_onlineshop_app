// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/auth_response_model.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LoginBloc(
    this.authRemoteDatasource,
  ) : super(_Initial()) {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final response =
          await authRemoteDatasource.login(event.email, event.password);
      response.fold(
        (l) => emit(_Erorr(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
