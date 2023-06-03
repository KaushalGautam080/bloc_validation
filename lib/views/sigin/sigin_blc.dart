import 'package:blc_validation/views/sigin/sigin_event.dart';
import 'package:blc_validation/views/sigin/sigin_state.dart';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SigInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 7) {
        emit(
          SignInErrorState("Please enter a Strong Password"),
        );
      } else {
        emit(SignInValidState());
      }
    });
    on<SigInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
