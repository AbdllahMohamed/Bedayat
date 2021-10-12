import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
import 'package:bedayat/controllers/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController _email = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ResetPasswordController resetPasswordController = Get.put(
    ResetPasswordController(),
  );

  _reset() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    var message = await resetPasswordController.resetPassword(_email.text);

    Get.defaultDialog(title: "infomration!".tr, middleText: message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'.tr),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomeTextFormField(
                controller: _email,
                hintText: 'Email'.tr,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter a valid value'.tr;
                  } else if (!val.isEmail) {
                    return 'The email is invalid'.tr;
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              Obx(() {
                return resetPasswordController.loadingProcess.value
                    ? Center(child: CircularProgressIndicator())
                    : ActionButton(
                        label: 'Confirm'.tr,
                        onPressed: () async {
                          _reset();
                        });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
