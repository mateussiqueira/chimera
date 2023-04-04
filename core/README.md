# Core

The Core package is a dart package that provides abstractions for building apps and their micro frontends. It defines patterns for routing and dependency injection, making it easy to organize and structure your codebase.

## Features

- Defines a common routing pattern for both apps and micro frontends
- Provides patterns for dependency injection system to make it easy to manage and share dependencies across different parts of the codebase
- Defines patterns for code organization and structuring
- Provides utility functions for common functionality such as data fetching and handling errors

## Getting started

### Import

Depend on this package in desired OPX App `pubspec.yaml`:
```yaml
core:
  git:
    url: https://github.com/qcx/chimera.git
    ref: core-v1.0.0
    path: core
```

### New App

For an application, it is necessary to implement the BaseApp class and provide its core constraints.
If you have any questions, see the [Ibmec](https://github.com/qcx/app-opx-ibmec) application repository.

First of all, in your runApp input class, use the multi-class hierarchy (`mixins`) to use the BaseApp properties.
The reason for using multiple class hierarchies is because of the need to also extend from a `Stateless` or `Stateful` class.
We recommend that you use a `Stateful` class in this case.

```dart
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with BaseApp {}
```

If you went with a Stateful class, in the initState method, insert calls to the following initializers:

```dart
@override
void initState() {
  _initEnvironments();
  _initIterable();
  super.registerEvents();
  super.registerRouters();
  super.registerTranslations();
  super.initState();
  Intl.defaultLocale = 'pt_BR';
}
```

*Note¹: If you went with a Stateless class, proceed with the same code in the build; make sure this class will not be rebuilt.*

*Note²: See the documentation of [environment](../commons/environment) and [iterable](../commons/iterable) for how to construct `_initEnvironments` and `_initIterable` methods.*

*Note³: You can also overwrite the strings translation of application, see the [internationalization](../commons/internationalization) documentation to find out how.*

### New micro frontend

For an application, it is necessary to implement the MicroApp class and provide its constraints.
If you have any questions, see any micro frontend from [Chimera](https://github.com/qcx/Chimera) repository.

First of all, the entry point of a micro frontend is usually the `Resolver`. The resolver class should implement the abstract class `MicroApp` that contains the necessary contract.
Each resolver consists of a name, its routes and an [Event Bus](../commons/marcopolo) listener. A simple micro frontend resolver implementation is: 

```dart
class HelloWorldResolver implements MicroApp {
  @override
  String get name => 'hello-world';

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/hello-world',
          builder: (context, args) => Text('Hello world!'),
          transitionType: TransitionType.fullscreenDialogTransition,
        ),
      ];

  @override
  void Function(Event event) get listener => (event) async {};
}
```

*Note¹: If you went with a Stateless class, proceed with the same code in the build; make sure this class will not be rebuilt.*
