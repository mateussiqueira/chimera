import 'package:dependencies/dependencies.dart';

import 'shared.dart';

class MaxInstallmentsEntity extends Equatable {
  const MaxInstallmentsEntity({
    required this.times,
    required this.total,
  });

  final int? times;
  final PriceEntity? total;

  @override
  List get props => [times, total];
}
