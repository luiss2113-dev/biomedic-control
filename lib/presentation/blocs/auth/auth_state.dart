part of 'auth_bloc.dart';

enum AppStatus { authenticated, unauthenticated, loading }

final class AuthState extends Equatable {
  final AppStatus status;

  const AuthState._({
    required this.status,
  });

  const AuthState.authenticated() : this._(status: AppStatus.authenticated);

  const AuthState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object> get props => [status];
}
