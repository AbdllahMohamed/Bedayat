import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:bedayat/const/const.dart';

class PaymentWebViewScreen extends StatefulWidget {
  String checkoutId;
  PaymentWebViewScreen({
    Key? key,
    required this.checkoutId,
  }) : super(key: key);
  @override
  PaymentWebViewScreenState createState() => PaymentWebViewScreenState();
}

class PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print('$baseUrl/payments/${widget.checkoutId}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebView(
            initialUrl: '$baseUrl/payments/${widget.checkoutId}',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
