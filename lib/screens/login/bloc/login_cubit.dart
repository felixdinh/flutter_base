import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: AuthStatus.unauthenticated));

  void login(){
    emit(const LoginState.authenticated());
  }

  void logout(){
    emit(const LoginState.unauthenticated());
  }
}
