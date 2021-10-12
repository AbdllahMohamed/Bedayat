import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/edit_account_controller.dart';
import 'package:bedayat/controllers/event_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditAccountInformationScreen extends StatefulWidget {
  const EditAccountInformationScreen({ Key? key }) : super(key: key);

  @override
  _EditAccountInformationScreenState createState() => _EditAccountInformationScreenState();
}

class _EditAccountInformationScreenState extends State<EditAccountInformationScreen> {
  
  final EditAccountController _editAccountController = Get.put(EditAccountController());



  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() =>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 25),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.appCalender,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 25),
                    Text(
                      'My account'.tr,
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ],
                ),
              ),


              _editAccountController.initLoading.value ? Center(child : Center(child: CircularProgressIndicator())) : Form(
                key: _editAccountController.formKey,

                child: Column(children: [
                          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(children: [
                    Row(children: [
                        Icon(Icons.account_box),
                        SizedBox(width: 10),
                        Text(
                          'Account Details'.tr,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.titleColor,
                          ),
                        ),
                    ],)
                  ],),
                ),
              
                SizedBox(height: 5),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextFormField(
                    controller: _editAccountController.name,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid value'.tr;
                      }
                    },
                    hintText: 'Name'.tr,
                    prefixIcon: Image.asset(AppImages.appCalender),
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextFormField(
                    controller: _editAccountController.phone,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid value'.tr;
                      }
                    },
                    hintText: 'Password'.tr,
                    prefixIcon: Image.asset(AppImages.appCalender),
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextFormField(
                  controller: _editAccountController.email,
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
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(children: [
                    Row(children: [
                        Icon(Icons.lock),
                        SizedBox(width: 10),
                        Text(
                          'Password'.tr,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.titleColor,
                          ),
                        ),
                    ],)
                  ],),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextFormField(
                    controller: _editAccountController.password,
                    validator: (val) {
                      if(_editAccountController.newPassword.text != "" || _editAccountController.newPasswordConfirm.text != "" ){
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } 
                      }
                    },
                    hintText: 'current password'.tr,
                    prefixIcon: Image.asset(AppImages.appEmailIcon),
                  ),
                ),
                        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextFormField(
                    controller: _editAccountController.newPassword,
                    validator: (val) {
                      if(_editAccountController.password.text != ""){
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } 
                      }
                    },
                    hintText: 'new password'.tr,
                    prefixIcon: Image.asset(AppImages.appEmailIcon),
                  ),
                ),
                        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextFormField(
                    controller: _editAccountController.newPasswordConfirm,
                    validator: (val) {
                      if(_editAccountController.password.text != ""){
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } 
                      }
                    },
                    hintText: 'confirm new password'.tr,
                    prefixIcon: Image.asset(AppImages.appEmailIcon),
                  ),
                ),           
              
                SizedBox(height: 20,),
              
                _editAccountController.loadingProcess.value ? Center(child: CircularProgressIndicator()) : ActionButton(
                  label: 'save'.tr,
                  onPressed: _editAccountController.updateUser
                )    
                ],),
              )
  
            ],
          ),
        )
        ),
      ),
    );
  }
}