import 'package:design_system/design_system.dart';

class CheckboxList {
  static const List<Widget> smListCheckbox = [
    CheckboxBaseWidget.checkboxSm(checked: false),
    CheckboxBaseWidget.checkboxSm(checked: true),
    CheckboxBaseWidget.checkboxSm(checked: false, disabled: true),
    CheckboxBaseWidget.checkboxSm(checked: true, disabled: true)
  ];

  static const List<Widget> mdListCheckbox = [
    CheckboxBaseWidget.checkboxMd(checked: false),
    CheckboxBaseWidget.checkboxMd(checked: true),
    CheckboxBaseWidget.checkboxMd(checked: false, disabled: true),
    CheckboxBaseWidget.checkboxMd(checked: true, disabled: true)
  ];

  static const List<Widget> smListRadio = [
    CheckboxBaseWidget.radioButtonSm(checked: false),
    CheckboxBaseWidget.radioButtonSm(checked: true),
    CheckboxBaseWidget.radioButtonSm(checked: false, disabled: true),
    CheckboxBaseWidget.radioButtonSm(checked: true, disabled: true)
  ];

  static const List<Widget> mdListRadio = [
    CheckboxBaseWidget.radioButtonMd(checked: false),
    CheckboxBaseWidget.radioButtonMd(checked: true),
    CheckboxBaseWidget.radioButtonMd(checked: false, disabled: true),
    CheckboxBaseWidget.radioButtonMd(checked: true, disabled: true)
  ];
}
