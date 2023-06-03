abstract class SigInState {}

class SignInInitialState extends SigInState {}

class SignInValidState extends SigInState {}

class SignInErrorState extends SigInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}

class SignInLoadingState extends SigInState {}
