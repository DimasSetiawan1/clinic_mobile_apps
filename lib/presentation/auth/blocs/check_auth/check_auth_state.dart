part of 'check_auth_bloc.dart';



@freezed
class CheckAuthState with _$CheckAuthState {
  const factory CheckAuthState.initial() = _Initial;

  const factory CheckAuthState.authenticated() = _Authenticated;

  const factory CheckAuthState.unauthenticated() = _Unauthenticated;
}
