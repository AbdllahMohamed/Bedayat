import 'dart:io';

import 'package:bedayat/UI/screens/checkout_status/checkout_status.dart';
import 'package:bedayat/UI/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    String paymetUrl = '$baseUrl/payments/${widget.checkoutId}';
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
          child: Expanded(
            child: WebView(
              initialUrl: paymetUrl,
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url != paymetUrl)
                  print('allowing navigation to $request');
                print('allowing navigation to "${request.url}');
                Get.to(CheckoutStatusScreen(checkoutId: widget.checkoutId));
                return NavigationDecision.navigate;
              },
              // onPageFinished: (String url) {
              //   print("widget.checkoutId" + widget.checkoutId);
              //   Get.to(CheckoutStatusScreen(checkoutId: widget.checkoutId));

              //   // print('Page finished loading: $url');
              // },
            ),
          ),
        ),
      ),
    );
  }
}
