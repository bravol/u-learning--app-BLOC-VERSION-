class SingInState {
  final String email;
  final String password;
  const SingInState({this.email = '', this.password = ''});
  SingInState copyWith({String? email, String? password}) {
    return SingInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
