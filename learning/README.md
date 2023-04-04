# Learning

This micro frontend is responsible for providing an online learning environment. It includes a view of the enrollments and their contents, such as videos, PDF's, hyperlinks and assessments.

## Features

- Enrollments
- Content Types:
    - hyperlink
    - document
    - video
    - assessment
- Assessments

## Usage

First of all, see [Core](../core) setup.

Depend on this package in desired OPX App  `pubspec.yaml`:
```yaml  
learning:    
  git:    
    url: https://github.com/qcx/chimera.git    
    ref: learning-v1.0.0    
    path: learning  
```  

Import it and use `LearningResolver` on app.

```dart  
import 'package:learning/learning.dart';  
static List<MicroApp> microApps = [  LearningResolver(), // Add this.  
 ]; ```