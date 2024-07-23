//immutable class
class RegisterStates {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  //optional named parameter
  const RegisterStates({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  RegisterStates copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterStates(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
