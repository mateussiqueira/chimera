import 'package:dependencies/dependencies.dart';

class AddAttemptParams extends Equatable {
  const AddAttemptParams({required this.id});
  final String id;

  @override
  List get props => [id];
}
