import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    // String error = await authController.login(_email.text, _password.text);

    // if (error != "") {
    //   Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    // } else {
    //   Get.to(HomeScreen());
    // }
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
                      SizedBox(height: 50),
                      Center(child: Image.asset(AppImages.appLogo)),
                      SizedBox(height: 30),
                      Text(
                        'التسجيل',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w300),
                      ),

                      SizedBox(height: 30),

                      TextFormField(
                        controller: _email,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                          // else if (!val.isEmail) {
                          //   return 'البريد الالكترونى';
                          // }
                        },
                        decoration: InputDecoration(
                          hintText: 'رقم الجوال',
                          prefixIcon: Image.asset(AppImages.appPhoneIcon),
                          hintStyle: TextStyle(
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _email,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                          // else if (!val.isEmail) {
                          //   return 'البريد الالكترونى';
                          // }
                        },
                        decoration: InputDecoration(
                          hintText: 'البريد الألكترونى',
                          prefixIcon: Image.asset(AppImages.appEmailIcon),
                          hintStyle: TextStyle(
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
                          prefixIcon: Image.asset(AppImages.appPasswordIcon),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
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
                        height: 50,
                      ),
                      // Obx(() {
                      //   // ignore: unrelated_type_equality_checks
                      //   return authController.loadingProcess == true
                      //       ? Center(child: CircularProgressIndicator())
                      //       : ActionButton(
                      //           label: 'تسجيل الدخول',
                      //           onPressed: () async {
                      //             login();
                      //           });
                      // }),

                      ActionButton(
                          label: 'تسجيل الدخول',
                          onPressed: () async {
                            login();
                          }),

                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () async {
                            // await CountriesServices.getAll();
                            // Get.to(RegisterScreen());
                          },
                          child: Text(
                            'ليس لديك حساب ، قم بالتسجيل من هنا',
                            style: TextStyle(
                              fontSize: 17,
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
