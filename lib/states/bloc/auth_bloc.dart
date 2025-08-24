import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/repo/auth_repository.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class AuthError extends AuthState {
  final String message;
  final String type;
  AuthError(this.message, this.type);
}

class Unauthenticated extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial()) {
    _authRepository.userChanges.listen((user) {
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      if (email.isEmpty) {
        emit(AuthError("Email is required", "email"));
      } else if (!isEmailValid(email)) {
        emit(AuthError("Email is not valid", "email"));
      } else if (password.isEmpty) {
        emit(AuthError("Password is required", "password"));
      } else {
        final user = await _authRepository.signIn(
          email: email,
          password: password,
        );
        emit(Authenticated(user!));
      }
    } on FirebaseAuthException catch (e) {
      print("catching error ${e.message}");
      emit(AuthError(e.message ?? 'Unknown error', "login"));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      if (email.isEmpty) {
        emit(AuthError("Email is required", "email"));
      } else if (!isEmailValid(email)) {
        emit(AuthError("Email is not valid", "email"));
      } else if (password.isEmpty) {
        emit(AuthError("Password is required", "password"));
      } else {
        final user = await _authRepository.signUp(
          email: email,
          password: password,
        );
        emit(Authenticated(user!));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Unknown error', "signup"));
      // emit(Unauthenticated());
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(Unauthenticated());
  }

  // In your AuthCubit class
  void checkAuthStatus() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }
}

bool isEmailValid(String email) =>
    RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
