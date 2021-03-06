import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/login/login.dart';
import 'package:flutter/material.dart';

import 'UI/screens/checkout_status/checkout_status.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings? settings) {
    List<String> pathComponents = settings!.name!.split('/');
    print(pathComponents[1]);

    // switch (settings.name) {
    //   case RouteNames.login:
    if (pathComponents[1].contains('payment')) {
      final settingsUri = Uri.parse(settings.name!);
      //settingsUri.queryParameters is a map of all the query keys and values
      final checkoutId = settingsUri.queryParameters['id'];
      print("checkoutId : $checkoutId");
      return GeneratePageRoute(
          widget: CheckoutStatusScreen(
            checkoutId: checkoutId!,
            routeName: 'register',
          ),
          routeName: settings.name!);
    } else if (pathComponents[1] == '/') {
      return GeneratePageRoute(
          widget: LoginScreen(), routeName: settings.name!);
    } else
      return GeneratePageRoute(
          widget: LoginScreen(), routeName: settings.name!);
    //   case RouteNames.home:
    //     return GeneratePageRoute(
    //         widget: BottomNavigationWidget(), routeName: settings.name);

    //   default:
    //     return GeneratePageRoute(
    //         widget: LoginScreen(), routeName: settings.name);
    // }
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

class RouteNames {
  static const String login = '/login';
  static const String home = '/home';
}
