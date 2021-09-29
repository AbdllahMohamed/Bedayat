import 'package:bedayat/UI/screens/register/register_step_two.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
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

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  registerStepOne() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Get.to(RegisterStepTwoScreen(
      nameController: _nameController.text,
      phoneController: _phoneController.text,
      emailController: _emailController.text,
      passwordController: _passwordController.text,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
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
                              '1/6',
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
                      CustomeTextFormField(
                        controller: _nameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                          if (val.length < 3) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        prefixIcon:
                            Icon(Icons.person, color: AppColors.accentColor),
                        hintText: 'الاسم',
                      ),
                      CustomeTextFormField(
                        controller: _emailController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (!val.isEmail) {
                            return 'البريد الالكترونى غير صالح';
                          }
                        },
                        hintText: 'البريد الألكترونى',
                        prefixIcon: Image.asset(AppImages.appEmailIcon),
                      ),
                      CustomeTextFormField(
                        controller: _phoneController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                          if (val.length < 8) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        prefixIcon: Image.asset(AppImages.appPhoneIcon),
                        hintText: 'رقم الجوال',
                      ),
                      Container(
                        width: _deviceWidth * 0.86,
                        child: TextFormField(
                          controller: _passwordController,
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
                        height: 35,
                      ),
                      ActionButton(
                          label: 'التالى',
                          onPressed: () async {
                            registerStepOne();
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
