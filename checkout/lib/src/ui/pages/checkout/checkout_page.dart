import 'dart:convert';

import 'package:design_system/design_system.dart';

import 'checkout_presenter.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final CheckoutPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: SecondaryAppBarWidget(title: ''),
      body: ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          final url = presenter.url;
          if (url.isNotEmpty) {
            return WebViewWidget(
              url: presenter.url,
              channels: [
                WebViewChannel(
                  name: 'chimeraHandler',
                  onMessageReceived: (message) {
                    final json = jsonDecode(message);
                    switch (json['id']) {
                      case 'checkout:completed':
                        if (json['data']['paymentKind'] == 'boleto') {
                          final url = json['data']['paymentInfo']['url'];
                          presenter.download(url);
                        }
                        break;
                      case 'checkout:redirected':
                        Navigator.of(context).pop();
                        break;
                      case 'checkout:error':
                        Navigator.of(context).pop();
                        break;
                      default:
                    }
                  },
                )
              ],
              clearCache: true,
            );
          }
          return const EmptyWidget();
        },
      ),
    );
  }
}
