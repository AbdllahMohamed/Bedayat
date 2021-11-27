import 'package:bedayat/UI/screens/payment/payment.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/controllers/app_bindings.dart';
import 'package:bedayat/routes.dart';
import 'package:bedayat/utils/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'UI/screens/payment_web_view/payment_web_view.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

var token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // if (!kIsWeb) {
  //   channel = const AndroidNotificationChannel(
  //     'high_importance_channel', // id
  //     'High Importance Notifications', // title
  //     'This channel is used for important notifications.', // description
  //     importance: Importance.high,
  //   );

  //   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      Get.snackbar(
        message.notification!.title!,
        message.notification!.body!,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(10),
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
  });

  await GetStorage.init();
  final box = GetStorage();
  var token = box.read('token');

  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final token;
  MyApp({this.token});
  @override
  Widget build(BuildContext context) {
    print('languageCode');
    print('${GetStorage().read('languageCode')}');
    print('${GetStorage().read('token')}');
    return GetMaterialApp(
      title: 'Bedayat',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      initialBinding: AppBinding(),
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'CAIROBLACK',
        colorScheme: ColorScheme.light(primary: AppColors.primaryColor)
            .copyWith(secondary: AppColors.accentColor),
      ),
      translations: Translation(),
      locale: Locale("${GetStorage().read('languageCode')}" == "null"
          ? 'ar'
          : "${GetStorage().read('languageCode')}"),
      initialRoute: token != null ? '/home' : '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: PaymentWebviewScreen(
      //   routeName: "register",
      //   checkoutId: "405F555EDB56649D6154B1BF91F8517C.prod01-vm-tx17",
      // ),

      // home: PaymentScreen(
      //   childId: '1',
      //   routeName: 'register',
      // ),
    );
  }
}
