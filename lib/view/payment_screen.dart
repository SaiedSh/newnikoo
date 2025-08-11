import 'package:bookapp/controller/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentWebViewPage extends StatefulWidget {
  final String paymentUrl;

  const PaymentWebViewPage({Key? key, required this.paymentUrl})
      : super(key: key);

  @override
  _PaymentWebViewPageState createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(widget.paymentUrl)),
      onWebViewCreated: (controller) {
        webViewController = controller;
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        final uri = navigationAction.request.url;
        if (uri != null &&
            uri.scheme == "myapp" &&
            uri.host == "payment-return") {
          Navigator.pushReplacementNamed(context, MyRoutes.navigationBarScreen);
          return NavigationActionPolicy.CANCEL;
        }
        return NavigationActionPolicy.ALLOW;
      },
    ));
  }
}
