abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SigInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SigInSubmittedEvent(this.email, this.password);
}
