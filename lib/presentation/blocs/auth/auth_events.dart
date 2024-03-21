part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLoginPressed extends AuthEvent {
  const AuthLoginPressed();
}

final class _AuthUserChanged extends AuthEvent {
  const _AuthUserChanged(this.user);

  final User? user;
}

final class AuthLogoutPressed extends AuthEvent {
  const AuthLogoutPressed();
}
