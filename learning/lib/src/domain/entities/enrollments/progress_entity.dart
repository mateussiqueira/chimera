import 'package:dependencies/dependencies.dart';

class ProgressEntity extends Equatable {
  const ProgressEntity({
    this.contentId,
  });
  final String? contentId;

  @override
  List get props => [contentId];
}
