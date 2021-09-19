import 'dart:math';

import 'package:bedayat/UI/screens/checkout_status/checkout_status.dart';
import 'package:bedayat/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class WebViewXPage extends StatefulWidget {
  String checkoutId;
  WebViewXPage({Key? key, required this.checkoutId}) : super(key: key);

  @override
  _WebViewXPageState createState() => _WebViewXPageState();
}

class _WebViewXPageState extends State<WebViewXPage> {
  late WebViewXController webviewController;

  Size get screenSize => MediaQuery.of(context).size;
  @override
  void initState() {
    super.initState();
    _setUrl();
  }

  void _setUrl() {
    Future.delayed(Duration(seconds: 2), () {
      webviewController.loadContent(
        '$baseUrl/payments/${widget.checkoutId}',
        SourceType.urlBypass,
      );
    });
  }

  void _navegatoTo() {
    Get.to(CheckoutStatusScreen(checkoutId: widget.checkoutId));
  }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f5),
      appBar: AppBar(
        title: const Text('Payement'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                child: WebViewX(
                  key: const ValueKey('webviewx'),
                  initialContent: '$baseUrl/payments/${widget.checkoutId}',
                  initialSourceType: SourceType.urlBypass,
                  height: screenSize.height * 0.8,
                  width: screenSize.width * 0.8,
                  onWebViewCreated: (controller) =>
                      webviewController = controller,
                  navigationDelegate: (navigation) {
                    if (navigation.content.source.toString() !=
                        '$baseUrl/payments/${widget.checkoutId}') _navegatoTo();
                    return NavigationDecision.navigate;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
