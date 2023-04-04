import 'dart:async';

import 'event.dart';

abstract class EventBus {
  void emit(Event event);
  StreamSubscription<Event> listener<T>();
}
