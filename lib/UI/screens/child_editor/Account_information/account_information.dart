import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformation extends StatefulWidget {
  final String routename;
  AccountInformation({Key? key, required this.routename}) : super(key: key);
  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  final _formKey = GlobalKey<FormState>();

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

    childEditorController.step += 3;
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
                    SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Image.asset(
                          AppImages.appSubLogo,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Register'.tr,
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
                      'Personal Data'.tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomeTextFormField(
                      controller: childEditorController.nameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      prefixIcon:
                          Icon(Icons.person, color: AppColors.accentColor),
                      hintText: 'Name'.tr,
                    ),
                    CustomeTextFormField(
                      controller: childEditorController.emailController,
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
                    CustomeTextFormField(
                      controller: childEditorController.phoneController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 8) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      prefixIcon: Image.asset(AppImages.appPhoneIcon),
                      hintText: 'Phone Number'.tr,
                    ),
                    Container(
                      width: _deviceWidth * 0.86,
                      child: TextFormField(
                        controller: childEditorController.passwordController,
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
                      height: 35,
                    ),
                    ActionButton(
                        label: 'Next'.tr,
                        onPressed: () async {
                          registerStepOne();
                        }),
                    SizedBox(
                      height: 20,
                    ),
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
