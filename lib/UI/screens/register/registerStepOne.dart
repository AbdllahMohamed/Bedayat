import 'package:bedayat/UI/screens/register/registerStepTwo.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStepOneScreen extends StatefulWidget {
  @override
  _RegisterStepOneScreenState createState() => _RegisterStepOneScreenState();
}

class _RegisterStepOneScreenState extends State<RegisterStepOneScreen> {
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

  Register() async {
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }
    // String error = await authController.Register(_email.text, _password.text);

    // if (error != "") {
    //   Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    // } else {
    //   Get.to(HomeScreen());
    // }

    Get.to(RegisterStepTwoScreen());
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Image.asset(
                      //       AppImages.appSubLogo,
                      //     ),
                      //     // Container(
                      //     //   width: 200,
                      //     // )
                      //   ],
                      // ),
                      Image.asset(
                        AppImages.appSubLogo,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'التسجيل',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 6,
                                color: AppColors.accentColor,
                              ),
                            ),
                            child: Text(
                              '1/5',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'البيانات الشخصية',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
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
                          prefixIcon: Image.asset(AppImages.appPhoneIcon),
                          hintText: 'رقم الجوال',
                          hintStyle: TextStyle(color: AppColors.accentColor),
                        ),
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
                          prefixIcon: Image.asset(AppImages.appEmailIcon),
                          hintText: 'البريد الألكترونى',
                          hintStyle: TextStyle(color: AppColors.accentColor),
                        ),
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
                        height: 35,
                      ),
                      // Obx(() {
                      //   // ignore: unrelated_type_equality_checks
                      //   return authController.loadingProcess == true
                      //       ? Center(child: CircularProgressIndicator())
                      //       : ActionButton(
                      //           label: 'تسجيل الدخول',
                      //           onPressed: () async {
                      //             Register();
                      //           });
                      // }),

                      ActionButton(
                          label: 'التالى',
                          onPressed: () async {
                            Register();
                          }),
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
