import 'package:bedayat/models/user.dart';
import 'package:bedayat/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class EditAccountController extends GetxController {
    // loading handler
    var loadingProcess = true.obs;
    // init loading handler 
    var initLoading = true.obs;

    // form fields
    TextEditingController name = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController phone = new TextEditingController();

    TextEditingController password = new TextEditingController();
    TextEditingController newPassword = new TextEditingController();
    TextEditingController newPasswordConfirm = new TextEditingController();
    final formKey = GlobalKey<FormState>();

  
    // get user data from api
    initdata() async {
      User userData = await UsersServices.getUserInfo();
      name.text = userData.name.toString();
      email.text = userData.email.toString();
      phone.text = userData.phone.toString();
      loadingProcess.value = false;
      initLoading.value = false;
    }

    // init controller -> get the user data from api
    @override 
    void onInit() {
       super.onInit();
       initdata();
    }

    // error handler
    sendErrorToScreen(String title, String content){
        Get.snackbar(
            title.tr,
            content.tr,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            backgroundColor: Colors.red,
            colorText: Colors.white
        );
    }

    // submit function
    updateUser() async {
      loadingProcess.value = true;
        if (formKey.currentState!.validate()) {
        if(newPassword.text != newPasswordConfirm.text){
          // send error message if password not match the other password
          Get.snackbar(
            "Error !".tr,
            "new password and new password confirmation does not match".tr,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            backgroundColor: Colors.red,
            colorText: Colors.white
          );
        }else{

          var user =  await UsersServices.updateUserData(
          name: name.text,
          email: email.text,
          phone: phone.text,
          password: password.text,
          newPassword: newPassword.text,
          errorHandler : sendErrorToScreen
        );
        
        // show success message when update request back without error
        if(user != null){
            Get.snackbar(
              "Successful ".tr,
              "Your request has been successfully executed".tr,
              snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              backgroundColor: Colors.green,
              colorText: Colors.white
            );
        }
        
        }
      }
        loadingProcess.value = false;
    }
  
}
