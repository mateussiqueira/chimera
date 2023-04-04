import 'package:dependencies/dependencies.dart';

class AddAccountParams extends Equatable {
  final String name;
  final String email;
  final String password;

  @override
  List get props => [email, password];

  const AddAccountParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
