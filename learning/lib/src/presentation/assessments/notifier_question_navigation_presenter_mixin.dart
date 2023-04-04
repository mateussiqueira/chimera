import 'package:design_system/design_system.dart';

import '../../ui/pages/assessment/widgets/question_navigation_presenter_mixin.dart';

mixin NotifierQuestionNavigationMixin
    implements QuestionNavigationPresenterMixin {
  int _currentIndex = 0;
  int _total = 0;
  bool _open = false;
  bool _runAnimation = true;

  UpdatePresenter? questionNavigationMixinListenable;

  void _update() {
    questionNavigationMixinListenable?.update();
  }

  @override
  void initNavigationParams(int index, int total) {
    _currentIndex = index;
    _total = total;
    _update();
  }

  @override
  int getTotal() {
    return _total;
  }

  @override
  int currentIndex() {
    return _currentIndex;
  }

  @override
  bool isSelectedIndex(int index) {
    return _currentIndex == index;
  }

  @override
  void setCurrentIndex(int index) {
    if (index >= 0 || index < getTotal()) {
      _currentIndex = index;
      _update();
    }
  }

  @override
  bool canGoBack() {
    return _currentIndex > 0;
  }

  @override
  void back() {
    setCurrentIndex(_currentIndex - 1);
  }

  @override
  bool canGoForward() {
    return _currentIndex < getTotal() - 1;
  }

  @override
  void forward() {
    setCurrentIndex(_currentIndex + 1);
  }

  @override
  bool isOpen() {
    return _open;
  }

  @override
  void setOpen(bool open) {
    _open = open;
    _update();
  }

  @override
  void toggleOpen() {
    _open = !_open;
    _update();
  }

  @override
  bool showForwardButton() => true;

  @override
  bool showSendButton() => false;

  @override
  Future<bool> send() async => false;

  @override
  bool get runAnimation => _runAnimation;

  @override
  set runAnimation(bool value) {
    _runAnimation = value;
  }
}
