# Profile

This micro frontend is responsible for displaying user details, certificates of completed courses and helpful resources such as a help center and legal information.

## Features

- Show user details
- Certificates:
    - Download (PDF or JPEG)
    - Share (PDF or JPEG)
- Help Center (externally open frequently asked questions and support resources)
- Legal information (terms of service and privacy policy)

## Usage

First of all, see [Core](../core) setup.

Depend on this package in desired OPX App  `pubspec.yaml`:
```yaml  
profile:    
  git:    
    url: https://github.com/qcx/chimera.git    
    ref: profile-v1.0.0    
    path: profile  
```  

Import it and use `ProfileResolver` on app.

```dart  
import 'package:profile/profile.dart';  
static List<MicroApp> microApps = [  ProfileResolver(), // Add this.  
 ]; ```