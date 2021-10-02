import 'package:bedayat/UI/screens/checkout_status/add_child_checkout_stats/failuar_add_child_checkout.dart';
import 'package:bedayat/UI/screens/checkout_status/add_child_checkout_stats/success_add_child_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';

// ignore: must_be_immutable
class AddChildCheckotStatusScreen extends StatefulWidget {
  final String checkoutId;
  // final int selectedBranchIndex;
  // final String childNameController;
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

  AddChildCheckotStatusScreen({
    Key? key,
    required this.checkoutId,
    // required this.selectedBranchIndex,
    // required this.childNameController,
    // required this.selectedType,
    // required this.emergencyNumberController,
    // required this.anthorNotesController,
    // required this.selectedRelationsOne,
    // required this.emailOneController,
    // required this.selectedRelationsTwo,
    // required this.sensitificController,
    // required this.phoneOneController,
    // required this.emailTwoController,
    // required this.phoneTwoController,
    // required this.familyCardPhoto,
    // required this.vaccinationCertificate,
    // required this.doctuumnet,
    // required this.groupId,
    // required this.techerId,
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
  _AddChildCheckotStatusScreenState createState() =>
      _AddChildCheckotStatusScreenState();
}

class _AddChildCheckotStatusScreenState
    extends State<AddChildCheckotStatusScreen> {
  CheckoutStatusController checkoutStatusController =
      Get.put(CheckoutStatusController());
  @override
  void initState() {
    super.initState();

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
                      ? SuccessAddChildCheckout(
                          // selectedBranchIndex: widget.selectedBranchIndex,
                          // childNameController: widget.childNameController,
                          // selectedType: widget.selectedType,
                          // selectedRelationsOne: widget.selectedRelationsOne,
                          // selectedRelationsTwo: widget.selectedRelationsTwo,
                          // emergencyNumberController:
                          //     widget.emergencyNumberController,
                          // anthorNotesController: widget.anthorNotesController,
                          // sensitificController: widget.sensitificController,
                          // emailOneController: widget.emailOneController,
                          // phoneOneController: widget.phoneOneController,
                          // emailTwoController: widget.emailTwoController,
                          // phoneTwoController: widget.phoneTwoController,
                          // familyCardPhoto: widget.familyCardPhoto,
                          // vaccinationCertificate: widget.vaccinationCertificate,
                          // doctuumnet: widget.doctuumnet,
                          // groupId: widget.groupId,
                          // techerId: widget.techerId,
                          // checkoutId: widget.checkoutId,
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
                          // actualselectedDate: widget.actualselectedDate,
                          )
                      : FailuarAddChildCheckout(
                          // checkoutId: widget.checkoutId,
                          // selectedBranchIndex: widget.selectedBranchIndex,
                          // childNameController: widget.childNameController,
                          // selectedType: widget.selectedType,
                          // selectedRelationsOne: widget.selectedRelationsOne,
                          // selectedRelationsTwo: widget.selectedRelationsTwo,
                          // emergencyNumberController:
                          //     widget.emergencyNumberController,
                          // anthorNotesController: widget.anthorNotesController,
                          // sensitificController: widget.sensitificController,
                          // emailOneController: widget.emailOneController,
                          // phoneOneController: widget.phoneOneController,
                          // emailTwoController: widget.emailTwoController,
                          // phoneTwoController: widget.phoneTwoController,
                          // familyCardPhoto: widget.familyCardPhoto,
                          // vaccinationCertificate: widget.vaccinationCertificate,
                          // doctuumnet: widget.doctuumnet,
                          // groupId: widget.groupId,
                          // techerId: widget.techerId,
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
                          // actualselectedDate: widget.actualselectedDate,
                          );
                },
              ),
      ),
    );
  }
}
