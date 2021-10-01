import 'package:bedayat/UI/screens/checkout_status/register_checkout_status/failuar_register_checkout.dart';
import 'package:bedayat/UI/screens/checkout_status/register_checkout_status/success_register_checkout.dart';
import 'package:bedayat/UI/screens/register/register_step_five.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterCheckoutStautusScreen extends StatefulWidget {
  String checkoutId;
  // final String nameController;
  // final String phoneController;
  // final String emailController;
  // final String passwordController;
  // //final String location;
  // final int selectedBranchIndex;
  // final String childNameController;
  // // final String selectedAge;
  // final String selectedType;
  // final String selectedRelationsOne;
  // final String selectedRelationsTwo;
  // final String emergencyNumberController;
  // final String anthorNotesController;
  // final String sensitificController;
  // final String emailOneController;
  // final String phoneOneController;
  // final String emailTwoController;
  // final String phoneTwoController;
  // final int groupId;
  // final int techerId;

  // final String actualselectedDate;
  // final String relationOnefirstNameController;
  // final String relationOneSecondNameController;
  // final String relationOneThirdController;
  // final String relationTwoFirstController;
  // final String relationTwoScecondController;
  // final String relationTwoThirdController;
  // final String emergencyNameController;
  // final String emergencyRelationController;

  // final String streetController;
  // final String cityController;
  // final String stateController;
  // final String postCodeController;
  // final String givenNameController;
  // final String surnameController;

  // final XFile? familyCardPhoto;
  // final XFile? vaccinationCertificate;
  // final XFile? doctuumnet;
  RegisterCheckoutStautusScreen({
    Key? key,
    required this.checkoutId,
    // required this.nameController,
    // required this.phoneController,
    // required this.emailController,
    // required this.passwordController,
    // required this.selectedBranchIndex,
    // required this.childNameController,
    // //required this.selectedAge,
    // required this.selectedType,
    // required this.selectedRelationsOne,
    // required this.selectedRelationsTwo,
    // required this.emergencyNumberController,
    // required this.anthorNotesController,
    // required this.sensitificController,
    // required this.emailOneController,
    // required this.phoneOneController,
    // required this.emailTwoController,
    // required this.phoneTwoController,
    // required this.groupId,
    // required this.techerId,
    // required this.familyCardPhoto,
    // required this.vaccinationCertificate,
    // required this.doctuumnet,
    // required this.actualselectedDate,
    // required this.relationOnefirstNameController,
    // required this.relationOneSecondNameController,
    // required this.relationOneThirdController,
    // required this.relationTwoFirstController,
    // required this.relationTwoScecondController,
    // required this.relationTwoThirdController,
    // required this.emergencyNameController,
    // required this.emergencyRelationController,
    // required this.streetController,
    // required this.cityController,
    // required this.stateController,
    // required this.postCodeController,
    // required this.givenNameController,
    // required this.surnameController,
  }) : super(key: key);

  @override
  _RegisterCheckoutStautusScreenState createState() =>
      _RegisterCheckoutStautusScreenState();
}

class _RegisterCheckoutStautusScreenState
    extends State<RegisterCheckoutStautusScreen> {
  CheckoutStatusController checkoutStatusController =
      Get.put(CheckoutStatusController());
  // @override
  // void initState() {
  //   super.initState();

  //   //checkoutStatusController.fetchCheckoutStatusCode(widget.checkoutId);
  // }

  @override
  void initState() {
    super.initState();
    print('resgister checkout');
    print(Uri.base.toString());
    print(Uri.base.query);
    print(Uri.base.queryParameters['id']);

    checkoutStatusController.fetchCheckoutStatusCode(widget.checkoutId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => checkoutStatusController.loadingProcess.value
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.accentColor,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (_, i) {
                  return (checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.100.110" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              '000.000.000' ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.100.110" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.000" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.100" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.101" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.102" ||
                          checkoutStatusController
                                  .checkoutstatusCodeList[i].code ==
                              "000.300.103")
                      ? SuccessRegisterCheckout(
                          // nameController: widget.nameController,
                          // phoneController: widget.phoneController,
                          // emailController: widget.emailController,
                          // passwordController: widget.passwordController,
                          // selectedBranchIndex: widget.selectedBranchIndex,
                          // childNameController: widget.childNameController,
                          // selectedType: widget.selectedType,
                          // selectedRelationsOne: widget.selectedRelationsOne,
                          // selectedRelationsTwo: widget.selectedRelationsTwo,
                          // emergencyNumberController:
                          //     widget.emergencyNumberController,
                          // anthorNotesController: widget.anthorNotesController,
                          // sensitificController: widget.sensitificController,
                          // emailOneController: widget.emailController,
                          // phoneOneController: widget.phoneOneController,
                          // emailTwoController: widget.emailTwoController,
                          // phoneTwoController: widget.phoneTwoController,
                          // familyCardPhoto: widget.familyCardPhoto,
                          // vaccinationCertificate: widget.vaccinationCertificate,
                          // doctuumnet: widget.doctuumnet,
                          // groupId: widget.groupId,
                          // techerId: widget.techerId,
                          // checkoutId: widget.checkoutId,
                          // actualselectedDate: widget.actualselectedDate,
                          // relationOnefirstNameController:
                          //     widget.relationOnefirstNameController,
                          // relationOneSecondNameController:
                          //     widget.relationOneSecondNameController,
                          // relationOneThirdController:
                          //     widget.relationOneThirdController,
                          // relationTwoFirstController:
                          //     widget.relationTwoFirstController,
                          // relationTwoScecondController:
                          //     widget.relationTwoScecondController,
                          // relationTwoThirdController:
                          //     widget.relationTwoThirdController,
                          // emergencyNameController:
                          //     widget.emergencyNameController,
                          // emergencyRelationController:
                          //     widget.emergencyRelationController,
                          // streetController: streetController.text,
                          // cityController: cityController.text,
                          // stateController: stateController.text,
                          // postCodeController: postCodeController.text,
                          // givenNameController: givenNameController.text,
                          // surnameController: surnameController.text,
                          )
                      : FailuarRegisterCheckout(
                          // nameController: widget.nameController,
                          // phoneController: widget.phoneController,
                          // emailController: widget.emailController,
                          // passwordController: widget.passwordController,
                          // selectedBranchIndex: widget.selectedBranchIndex,
                          // childNameController: widget.childNameController,
                          // //  selectedAge: widget.selectedAge,
                          // selectedType: widget.selectedType,
                          // selectedRelationsOne: widget.selectedRelationsOne,
                          // selectedRelationsTwo: widget.selectedRelationsTwo,
                          // emergencyNumberController:
                          //     widget.emergencyNumberController,
                          // anthorNotesController: widget.anthorNotesController,
                          // sensitificController: widget.sensitificController,
                          // emailOneController: widget.emailController,
                          // phoneOneController: widget.phoneOneController,
                          // emailTwoController: widget.emailTwoController,
                          // phoneTwoController: widget.phoneTwoController,
                          // familyCardPhoto: widget.familyCardPhoto,
                          // vaccinationCertificate: widget.vaccinationCertificate,
                          // doctuumnet: widget.doctuumnet,
                          // groupId: widget.groupId,
                          // techerId: widget.techerId,
                          // checkoutId: "${GetStorage().read('checkoutId')}",
                          // actualselectedDate: widget.actualselectedDate,
                          // relationOnefirstNameController:
                          //     widget.relationOnefirstNameController,
                          // relationOneSecondNameController:
                          //     widget.relationOneSecondNameController,
                          // relationOneThirdController:
                          //     widget.relationOneThirdController,
                          // relationTwoFirstController:
                          //     widget.relationTwoFirstController,
                          // relationTwoScecondController:
                          //     widget.relationTwoScecondController,
                          // relationTwoThirdController:
                          //     widget.relationTwoThirdController,
                          // emergencyNameController:
                          //     widget.emergencyNameController,
                          // emergencyRelationController:
                          //     widget.emergencyRelationController,
                          // streetController: streetController.text,
                          // cityController: cityController.text,
                          // stateController: stateController.text,
                          // postCodeController: postCodeController.text,
                          // givenNameController: givenNameController.text,
                          // surnameController: surnameController.text,
                          );
                },
              ),
      ),
    );
  }
}
