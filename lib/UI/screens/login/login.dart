import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:bedayat/UI/screens/register/register_step_one.dart';
import 'package:bedayat/UI/screens/reset_password/reset_password.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_Controller.dart';
import 'package:bedayat/controllers/child_editor_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = new TextEditingController();

  TextEditingController _password = new TextEditingController();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    String error = await authController.login(_email.text, _password.text);

    if (error != "") {
      Get.defaultDialog(title: "Something went wrong".tr, middleText: error);
    } else {
      String? token = await FirebaseMessaging.instance.getToken();
      print(token);
      authController.sendToken(token!);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    print(Uri.base.toString());
    print(Uri.base.query);
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Center(child: Image.asset(AppImages.appLogo)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Login'.tr,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            "${GetStorage().read('languageCode')}" == "null"
                                ? 'EN'
                                : "${GetStorage().read('languageCode')}" == 'en'
                                    ? 'ع'
                                    : 'en'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              final locale = Get.locale;
                              final box = GetStorage();
                              if (locale == Locale('en')) {
                                Get.updateLocale(Locale('ar'));
                                box.write('languageCode', 'ع');
                                setState(() {});
                              } else {
                                Get.updateLocale(Locale('en'));
                                box.write('languageCode', 'en');
                                setState(() {});
                              }
                            },
                            child: Icon(Icons.language_rounded, size: 30)),
                      ],
                    ),
                    SizedBox(height: 30),
                    CustomeTextFormField(
                      controller: _email,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (!val.isEmail) {
                          return 'The email is invalid'.tr;
                        }
                      },
                      hintText: 'Email'.tr,
                      prefixIcon: Image.asset(AppImages.appEmailIcon),
                    ),
                    Container(
                      width: _deviceWidth * 0.86,
                      child: TextFormField(
                        controller: _password,
                        obscureText: _obscureText,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter a valid value'.tr;
                          } else if (val.length <= 3) {
                            return 'Please enter a valid value'.tr;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 18),
                          prefixIcon: Image.asset(
                            AppImages.appPasswordIcon,
                            width: 5,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.accentColor,
                            ),
                            onPressed: () {
                              _toggle();
                            },
                          ),
                          hintText: 'Password'.tr,
                          hintStyle: TextStyle(
                            color: AppColors.accentColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Obx(() {
                      return authController.loadingProcess.value
                          ? Center(child: CircularProgressIndicator())
                          : ActionButton(
                              label: 'Login'.tr,
                              onPressed: () async {
                                login();
                              });
                    }),
                    InkWell(
                      onTap: () async {
                        Get.to(ResetPasswordScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 8),
                        child: Text(
                          'did you forget your password ?'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff5D5E5E),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          childEditorController.step.value = 0;
                          Get.to(ChildEditorScreen(
                            routename: 'register',
                          ));
                        },
                        child: Text(
                          'You do not have an account, register here'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5D5E5E),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
