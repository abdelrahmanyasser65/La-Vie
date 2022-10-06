abstract class AuthState {}

class AuthInitialState extends AuthState {}

class ChangeLoginState extends AuthState {}

class ChangeSignState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUPSuccessState extends AuthState {}

class SignUpErrorState extends AuthState {}
