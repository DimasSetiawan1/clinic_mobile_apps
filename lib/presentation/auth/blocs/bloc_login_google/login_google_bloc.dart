import 'package:bloc/bloc.dart';
import 'package:clinic_mobile_apps/data/datasources/auth_remote_datasource.dart';
import 'package:clinic_mobile_apps/data/models/response/login_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_google_event.dart';
part 'login_google_state.dart';
part 'login_google_bloc.freezed.dart';

class LoginGoogleBloc extends Bloc<LoginGoogleEvent, LoginGoogleState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  LoginGoogleBloc(this._authRemoteDatasource) : super(_Initial()) {
    on<_LoginGoogle>((event, emit) async {
        emit(_Loading());
        final result =
            await _authRemoteDatasource.loginGoogleBackend(event.idToken);
        result.fold((l) {
          emit(_Error('Error during login: $l'));
        }, (r) => emit(_Success(r)));
      }
    );
  }
}
