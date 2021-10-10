import 'dart:async';
import 'dart:io';
import 'package:bedayat/UI/screens/checkout_status/register_checkout_status/register_checkout_status.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewx/webviewx.dart' as webviewX;
import 'package:webview_flutter/webview_flutter.dart' as webview;

// ignore: must_be_immutable
class RegisterPaymentWebviewScreen extends StatefulWidget {
  String checkoutId;

  RegisterPaymentWebviewScreen({
    Key? key,
    required this.checkoutId,
  }) : super(key: key);

  @override
  _RegisterPaymentWebviewScreenState createState() =>
      _RegisterPaymentWebviewScreenState();
}

class _RegisterPaymentWebviewScreenState
    extends State<RegisterPaymentWebviewScreen> {
  CheckoutStatusController checkoutStatusController =
      Get.put(CheckoutStatusController());
  late webviewX.WebViewXController webviewController;

  Size get screenSize => MediaQuery.of(context).size;

  final Completer<webview.WebViewController> _controller =
      Completer<webview.WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    kIsWeb ? _setUrl() : WebView.platform = SurfaceAndroidWebView();
  }

  void _setUrl() {
    Future.delayed(Duration(seconds: 2), () {
      webviewController.loadContent(
        baseUrl + 'payments/${GetStorage().read('checkoutId')}',
        webviewX.SourceType.url,
      );
    });
  }

  void _navegatoTo() {
    Get.to(RegisterCheckoutStautusScreen(
      checkoutId: widget.checkoutId,
    ));
  }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url = baseUrl + 'payments/${GetStorage().read('checkoutId')}';
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
                              print('on page start ' + src);
                            },
                            onPageFinished: (String src) async {
                              print('on page Finished ' + src);
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
