import 'package:bloc/bloc.dart';
import 'package:flutter_fic9_ecommerce/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_fic9_ecommerce/data/models/responses/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/requests/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const LoginState.loading());
      final respone = await AuthRemoteDatasource().login(event.data!);
      respone.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
