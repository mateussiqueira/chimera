import 'package:dependencies/dependencies.dart';

class ProductInfoEntity extends Equatable {
  const ProductInfoEntity({
    required this.goals,
  });

  final List<String>? goals;

  @override
  List get props => [
        goals,
      ];
}
