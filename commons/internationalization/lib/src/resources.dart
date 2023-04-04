import 'package:flutter/widgets.dart';

import 'pt_br/pt_br.dart';
import 'translation.dart';

class R {
  static Translation string = _ptBR;

  static Translation _ptBR = PtBR();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = _ptBR;
        break;
    }
  }

  static void init(Translation translation) {
    if (translation is PtBR) {
      _ptBR = translation;
    }
  }
}
