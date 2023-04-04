# Checkout

This micro frontend is responsible for managing the checkout process for a user's cart. It allows users to update and remove items from their cart, and start the checkout process. 

Note: The checkout process is currently implemented as a web-view of [Olimpo](https://github.com/qcx/olimpo) checkout, which handles the payment and order processing and emits status events.

## Features

- Cart
  - Add item
  - Remove item
- Checkout (currently web-view)

## Web-view events

Olimpo can communicate with events to report the checkout status. These events are sent via postMessage and need to be captured by channel name `chimeraHandler`.

| Event name          | Description                                                                                                                                                                                                                                         |     
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| checkout:completed  | Occurs when an order is completed <br>`Credit Card`: When an order is approved and payment is confirmed <br>`PIX`: When an order is approved and payment is confirmed <br>`Boleto`: When an order is created and the boleto/bank slip is generated. |  
| checkout:redirected | Occurs when the user tries to exit the checkout flow, for example by clicking on an "Access study environment" button after payment.                                                                                                                |    
| checkout:error      | Occurs when you have a payment gateway error or a payment failed/timed out                                                                                                                                                                          |

## Usage

First of all, see [Core](../core) setup.

Depend on this package in desired OPX App  `pubspec.yaml`:
```yaml
checkout:  
  git:  
    url: https://github.com/qcx/chimera.git  
    ref: checkout-v1.0.0  
    path: checkout
```

Import it and use `CheckoutResolver` on app.

```dart
import 'package:checkout/checkout.dart';

static List<MicroApp> microApps = [  
  CheckoutResolver(), // Add this.
  ];
  ```