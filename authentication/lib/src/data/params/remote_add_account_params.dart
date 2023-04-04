import '../../domain/domain.dart';

class RemoteAddAccountParams {
  final String name;
  final String email;
  final String password;

  RemoteAddAccountParams({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RemoteAddAccountParams.fromDomain(AddAccountParams params) =>
      RemoteAddAccountParams(
          name: params.name, email: params.email, password: params.password);

  Map toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };
}
