import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/events/events.dart';
import 'package:bedayat/UI/screens/home/home.dart';
import 'package:bedayat/UI/screens/register/registerStepOne.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  // Toggles the password show status
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
      Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    } else {
      //Get.offAll(EventsScreen());
      Get.offAll(BottomNavigationWidget());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Center(child: Image.asset(AppImages.appLogo)),
                      SizedBox(height: 20),
                      Text(
                        'دخول',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _email,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (!val.isEmail) {
                            return 'البريد الالكترونى غير صالح';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(AppImages.appEmailIcon),
                          hintText: 'البريد الألكترونى',
                          hintStyle: TextStyle(color: AppColors.accentColor),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _password,
                        obscureText: _obscureText,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (val.length <= 3) {
                            return 'كلمة السر قصيرة للغاية';
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
                          hintText: 'كلمة المرور',
                          hintStyle: TextStyle(
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Obx(() {
                        // ignore: unrelated_type_equality_checks
                        return authController.loadingProcess == true
                            ? Center(child: CircularProgressIndicator())
                            : ActionButton(
                                label: 'دخول',
                                onPressed: () async {
                                  login();
                                });
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () async {
                            // await CountriesServices.getAll();
                            Get.to(RegisterStepOneScreen());
                          },
                          child: Text(
                            'ليس لديك حساب ، قم بالتسجيل من هنا',
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
      ),
    );
  }
}
