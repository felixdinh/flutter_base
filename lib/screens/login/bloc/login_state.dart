part of 'login_cubit.dart';

enum AuthStatus{unknown,authenticated, unauthenticated}

class LoginState extends Equatable {
  final AuthStatus status;

  const LoginState({this.status = AuthStatus.unknown});
  const LoginState.authenticated() : status = AuthStatus.authenticated;
  const LoginState.unauthenticated() : status = AuthStatus.unauthenticated;

  @override
  List<Object> get props => [status];
}

