abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  PasswordEvent(this.password);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}

class SignInWithGoogleEvent extends SignInEvent {
  // final String email;
  // final String password;
  SignInWithGoogleEvent();
}
