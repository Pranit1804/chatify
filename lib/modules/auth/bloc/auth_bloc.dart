// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatify/modules/auth/auth_constants.dart';
import 'package:chatify/modules/auth/data/models/user_request_model.dart';
import 'package:chatify/modules/auth/domain/entities/auth_use_case.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/snackbar/bloc/snackbar_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;
  final SnackbarBloc _snackbarBloc;
  AuthBloc({
    required AuthUseCase authencationUseCase,
    required SnackbarBloc snackbarBloc,
  })  : _authUseCase = authencationUseCase,
        _snackbarBloc = snackbarBloc,
        super(AuthInitialState()) {
    on<SignupUserEvent>(_onSignupUserEvent);
  }

  void _onSignupUserEvent(SignupUserEvent event, Emitter emit) async {
    try {
      UserEntity user = await _authUseCase.signupUser(event.userRequestModel);
      emit(SignupUserSuccessState(userEntity: user));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case AuthConstants.weakPassword:
          _snackbarBloc
              .add(ShowSnackbarEvent.forError(AuthConstants.passwordError));
          break;
        case AuthConstants.emailAlreadyUsed:
          _snackbarBloc.add(
              ShowSnackbarEvent.forError(AuthConstants.emailAlreadyUsedError));
          break;
        default:
          _snackbarBloc.add(ShowSnackbarEvent.forSomethingWentWrong());
      }
    } catch (e) {
      _snackbarBloc.add(ShowSnackbarEvent.forSomethingWentWrong());
    }
  }
}
