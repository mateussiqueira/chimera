# Discovery

This micro frontend is responsible for the discovery of products. Users can browse through products (courses), view their pricing and installments (if applicable), search for specific products using a text query, and explore products by category.

## Features

- Home Page (Discovery Page)
- Search Discovery Page
- Search Page
- Product Detail Page
- Category Page

## Usage

First of all, see [Core](../core) setup.

Depend on this package in desired OPX App  `pubspec.yaml`:
```yaml  
discovery:    
  git:    
    url: https://github.com/qcx/chimera.git    
    ref: discovery-v1.0.0    
    path: discovery  
```  

Import it and use `DiscoveryResolver` on app.

```dart  
import 'package:discovery/discovery.dart';  
static List<MicroApp> microApps = [  DiscoveryResolver(), // Add this.  
 ]; ```