# Authentication

This micro frontend is responsible for managing user authentication and authorization in OPX applications. It allows users to log in with their credentials and recovery them if necessary.

Also integrated with external authentication providers: `Google Sign In` and `Sign In with Apple` .

## Features

-   Email and password login (Android & iOS)
-   Google sign in (Android & iOS)
-   Sign In with Apple (iOS Only)

## Usage

First of all, see [Core](../core) setup.

Depend on this package in desired OPX App  `pubspec.yaml`:
```yaml
authentication:  
  git:  
    url: https://github.com/qcx/chimera.git  
    ref: authentication-v1.0.0  
    path: authentication
```

Import it and use `AuthenticationResolver` on app.

```dart
import 'package:authentication/authentication.dart';

static List<MicroApp> microApps = [  
  AuthenticationResolver(), // Add this.
  ];
  ```