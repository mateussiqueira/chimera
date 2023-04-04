import 'dart:async';

import '../../domain/domain.dart';

class Marcopolo extends EventBus {
  Marcopolo._internal();

  static final Marcopolo _instance = Marcopolo._internal();
  factory Marcopolo() => _instance;

  final _controller = StreamController<Event>.broadcast();

  @override
  void emit(Event event) {
    _controller.sink.add(event);
  }

  @override
  StreamSubscription<Event> listener<T>() {
    return _controller.stream.listen((event) => event);
  }
}
