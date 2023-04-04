import 'package:dependencies/dependencies.dart';

class AuthenticationParams extends Equatable {
  final String email;
  final String password;

  @override
  List get props => [email, password];

  const AuthenticationParams({
    required this.email,
    required this.password,
  });
}
