import 'package:dependencies/dependencies.dart';

class UpdateProgressParams extends Equatable {
  const UpdateProgressParams({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
