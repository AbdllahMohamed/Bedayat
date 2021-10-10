import 'dart:async';
import 'dart:io';
import 'package:bedayat/UI/screens/checkout_status/add_child_checkout_stats/add_child_checkout_status.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewx/webviewx.dart' as webviewX;
import 'package:webview_flutter/webview_flutter.dart' as webview;

// ignore: must_be_immutable
class AddChildPaymentWebviewScreen extends StatefulWidget {
  final String checkoutId;

  AddChildPaymentWebviewScreen({
    Key? key,
    required this.checkoutId,
  }) : super(key: key);

  @override
  _AddChildPaymentWebviewScreenState createState() =>
      _AddChildPaymentWebviewScreenState();
}

class _AddChildPaymentWebviewScreenState
    extends State<AddChildPaymentWebviewScreen> {
  CheckoutStatusController checkoutStatusController =
      Get.put(CheckoutStatusController());
  late webviewX.WebViewXController webviewController;

  Size get screenSize => MediaQuery.of(context).size;

  final Completer<webview.WebViewController> _controller =
      Completer<webview.WebViewController>();

  @override
  void initState() {
    super.initState();
    kIsWeb ? _setUrl() : WebView.platform = SurfaceAndroidWebView();
  }

  void _setUrl() {
    Future.delayed(Duration(seconds: 2), () {
      webviewController.loadContent(
        baseUrl + 'payments/${widget.checkoutId}',
        webviewX.SourceType.url,
      );
    });
  }

  void _navegatoTo() {
    Get.to(AddChildCheckotStatusScreen(
      checkoutId: widget.checkoutId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    String url = baseUrl + 'payments/${widget.checkoutId}';
    print(url);

    return Scaffold(
      backgroundColor: Color(0xfff6f6f5),
      appBar: AppBar(
        title: Text('Payement'.tr),
        centerTitle: true,
      ),
      body: kIsWeb
          ? SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: webviewX.WebViewX(
                            key: const ValueKey('webviewx'),
                            initialContent: url,
                            initialSourceType: webviewX.SourceType.url,
                            height: screenSize.height * 0.9,
                            width: screenSize.width * 0.8,
                            onWebViewCreated: (controller) =>
                                webviewController = controller,
                            onPageStarted: (String src) async {
                              checkoutStatusController
                                  .fetchCheckoutStatusCode(widget.checkoutId);
                            },
                            onPageFinished: (String src) async {
                              checkoutStatusController
                                  .fetchCheckoutStatusCode(widget.checkoutId);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : webview.WebView(
              initialUrl: url,
              javascriptMode: webview.JavascriptMode.unrestricted,
              onWebViewCreated: (webview.WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print("WebView is loading (progress : $progress%)");
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.contains('payment?id')) _navegatoTo();
                return webview.NavigationDecision.navigate;
              },
              gestureNavigationEnabled: true,
            ),
    );
  }
}
