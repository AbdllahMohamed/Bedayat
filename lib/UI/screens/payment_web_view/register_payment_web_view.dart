import 'dart:async';
import 'dart:math';

import 'package:bedayat/UI/screens/checkout_status/register_checkout_status.dart';
import 'package:bedayat/const/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewx/webviewx.dart' as webviewX;

// ignore: must_be_immutable
class RegisterPaymentWebviewScreen extends StatefulWidget {
  String checkoutId;
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  //final String location;
  final int selectedBranchIndex;
  final String childNameController;
  final String selectedAge;
  final String selectedType;
  final String selectedRelationsOne;
  final String selectedRelationsTwo;
  final String emergencyNumberController;
  final String anthorNotesController;
  final String sensitificController;
  final String emailOneController;
  final String phoneOneController;
  final String emailTwoController;
  final String phoneTwoController;
  final int groupId;
  final int techerId;

  final XFile? familyCardPhoto;
  final XFile? vaccinationCertificate;
  final XFile? doctuumnet;

  RegisterPaymentWebviewScreen(
      {Key? key,
      required this.checkoutId,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.selectedBranchIndex,
      required this.childNameController,
      required this.selectedAge,
      required this.selectedType,
      required this.selectedRelationsOne,
      required this.selectedRelationsTwo,
      required this.emergencyNumberController,
      required this.anthorNotesController,
      required this.sensitificController,
      required this.emailOneController,
      required this.phoneOneController,
      required this.emailTwoController,
      required this.phoneTwoController,
      required this.groupId,
      required this.techerId,
      required this.familyCardPhoto,
      required this.vaccinationCertificate,
      required this.doctuumnet})
      : super(key: key);

  @override
  _RegisterPaymentWebviewScreenState createState() =>
      _RegisterPaymentWebviewScreenState();
}

class _RegisterPaymentWebviewScreenState
    extends State<RegisterPaymentWebviewScreen> {
  late webviewX.WebViewXController webviewController;

  Size get screenSize => MediaQuery.of(context).size;

  final Completer<webview.WebViewController> _controller =
      Completer<webview.WebViewController>();

  @override
  void initState() {
    super.initState();
    kIsWeb
        // ignore: unnecessary_statements
        ? _setUrl()
        : WebView.platform = SurfaceAndroidWebView();
  }

  void _setUrl() {
    Future.delayed(Duration(seconds: 2), () {
      webviewController.loadContent(
        '$baseUrl/payments/${widget.checkoutId}',
        webviewX.SourceType.urlBypass,
      );
    });
  }

  void _navegatoTo() {
    Get.to(RegisterCheckoutStautusScreen(
      nameController: widget.nameController,
      phoneController: widget.phoneController,
      emailController: widget.emailController,
      passwordController: widget.passwordController,
      selectedBranchIndex: widget.selectedBranchIndex,
      childNameController: widget.childNameController,
      selectedAge: widget.selectedAge,
      selectedType: widget.selectedType,
      selectedRelationsOne: widget.selectedRelationsOne,
      selectedRelationsTwo: widget.selectedRelationsTwo,
      emergencyNumberController: widget.emergencyNumberController,
      anthorNotesController: widget.anthorNotesController,
      sensitificController: widget.sensitificController,
      emailOneController: widget.emailController,
      phoneOneController: widget.phoneOneController,
      emailTwoController: widget.emailTwoController,
      phoneTwoController: widget.phoneTwoController,
      familyCardPhoto: widget.familyCardPhoto,
      vaccinationCertificate: widget.vaccinationCertificate,
      doctuumnet: widget.doctuumnet,
      groupId: widget.groupId,
      techerId: widget.techerId,
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
    String url =
        'https://600d-154-133-118-79.ngrok.io/payments/${widget.checkoutId}';
    print(url);
    return Scaffold(
      backgroundColor: Color(0xfff6f6f5),
      appBar: AppBar(
        title: const Text('Payement'),
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
                            initialSourceType: webviewX.SourceType.urlBypass,
                            height: screenSize.height * 0.9,
                            width: screenSize.width * 0.8,
                            onWebViewCreated: (controller) =>
                                webviewController = controller,
                            navigationDelegate: (navigation) {
                              if (navigation.content.source.toString() !=
                                  '$baseUrl/payments/${widget.checkoutId}')
                                _navegatoTo();
                              return webviewX.NavigationDecision.navigate;
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
                if (request.url != url) _navegatoTo();
                return webview.NavigationDecision.navigate;
              },
              gestureNavigationEnabled: true,
            ),
    );
  }
}
