import 'package:internationalization/src/interfaces/interfaces.dart';

mixin CommonsPtBR implements Commons {
  @override
  String get genericErrorMessage => "Ocorreu um erro, tente novamente";

  @override
  String get noInternetMessage => "Verifique sua internet e tente novamente";

  @override
  String get no => "Não";

  @override
  String get yes => "Sim";
}
