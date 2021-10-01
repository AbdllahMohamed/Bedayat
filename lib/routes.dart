import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/UI/screens/payment_web_view/add_child_payment_web_view.dart';
import 'package:bedayat/UI/screens/register/register_step_one.dart';
import 'package:flutter/material.dart';

import 'UI/screens/checkout_status/register_checkout_status.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case "/":
        return GeneratePageRoute(
            widget: LoginScreen(), routeName: settings.name!);
      case "/payment":
        return GeneratePageRoute(
            widget: RegisterCheckoutStautusScreen(), routeName: settings.name!);
      default:
        return GeneratePageRoute(
            widget: LoginScreen(), routeName: settings.name!);
    }
  }
}

class GeneratePageRoute extends PageRouteBuilder {
  final Widget? widget;
  final String? routeName;
  GeneratePageRoute({this.widget, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget!;
          },
          transitionDuration: Duration(seconds: 0),
        );
}
