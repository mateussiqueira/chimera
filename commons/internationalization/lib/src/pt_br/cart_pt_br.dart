import 'package:dependencies/dependencies.dart';
import 'package:internationalization/src/interfaces/interfaces.dart';

mixin CartPtBR implements Cart {
  @override
  String installmentsPrice(int maxInstallments, int value, String iso) {
    final currencyFormatter = NumberFormat.simpleCurrency(name: iso);
    final installmentValue = value / 100 / maxInstallments;
    final installments = currencyFormatter.format(installmentValue);

    return "${maxInstallments}x de $installments";
  }

  @override
  String get addMoreItems => 'Adicionar mais itens';

  @override
  String get cart => 'Carrinho';

  @override
  String get finalizeOrder => 'Finalizar pedido';

  @override
  String get inCash => 'à vista';

  @override
  String get total => 'Total';
}
