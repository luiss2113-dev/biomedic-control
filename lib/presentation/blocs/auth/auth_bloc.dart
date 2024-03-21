import 'dart:async';

import 'package:biomedic_control/data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BiotechRepository _repository;
  AuthBloc({required BiotechRepository repository})
      : _repository = repository,
        super(const AuthState._(status: AppStatus.loading)) {
    //EVENTS START
    on<AuthLoginPressed>(_onLoginWithGoogle);
    on<_AuthUserChanged>(_onUserChanged);
    on<AuthLogoutPressed>(_onLogoutRequested);
    _userSubscription = _repository.user.listen(
      (User? user) => add(_AuthUserChanged(user)),
    );
    //EVENTS END
  }

  late final StreamSubscription<User?> _userSubscription;

  void _onUserChanged(_AuthUserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user != null
          ? const AuthState.authenticated()
          : const AuthState.unauthenticated(),
    );
  }

  Future<void> _onLoginWithGoogle(event, emit) async {
    final loginResponse = await _repository.loginWithGmail();

    loginResponse.when(
      (failure) => emit(const AuthState.unauthenticated()),
      (isLoggued) => emit(
        const AuthState.authenticated(),
      ),
    );
  }

  void _onLogoutRequested(AuthEvent event, Emitter<AuthState> emit) {
    unawaited(_repository.logout());
    emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
