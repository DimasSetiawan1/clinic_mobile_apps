part of 'login_google_bloc.dart';

@freezed
class LoginGoogleState with _$LoginGoogleState {
  const factory LoginGoogleState.initial() = _Initial;

  const factory LoginGoogleState.loading() = _Loading;
  const factory LoginGoogleState.error(String errorMessage) = _Error;
  
  const factory LoginGoogleState.authenticated() = _Authenticated;
  const factory LoginGoogleState.unauthenticated() = _Unauthenticated;
}
