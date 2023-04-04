import 'package:design_system/design_system.dart';

mixin QuestionNavigationPresenterMixin on UpdatePresenter {
  void initNavigationParams(int index, int total);
  bool canGoBack();
  void back();
  bool canGoForward();
  void forward();
  bool isOpen();
  void setOpen(bool open);
  void toggleOpen();
  int currentIndex();
  void setCurrentIndex(int index);
  bool isSelectedIndex(int index);
  bool isAnsweredIndex(int index);
  bool isAnsweredAfterIndex(int index);
  bool isAnsweredBeforeIndex(int index);
  int getTotal();
  bool showForwardButton();
  bool showSendButton();
  Future<bool> send();
  bool get runAnimation;
  set runAnimation(bool value);
}
