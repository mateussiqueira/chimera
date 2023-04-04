import 'package:dependencies/dependencies.dart';

class RemoveProgressParams extends Equatable {
  const RemoveProgressParams({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
