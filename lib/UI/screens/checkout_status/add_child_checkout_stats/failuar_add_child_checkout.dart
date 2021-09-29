import 'package:bedayat/UI/screens/add_child/add_child_step_four.dart';
import 'package:bedayat/UI/screens/payment_web_view/add_child_payment_web_view.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class FailuarAddChildCheckout extends StatefulWidget {
  final String checkoutId;
  final int selectedBranchIndex;
  final String childNameController;
  final String selectedType;
  final String selectedRelationsOne;
  final String selectedRelationsTwo;
  final String emergencyNumberController;
  final String anthorNotesController;
  final String sensitificController;
  final String emailOneController;
  final String phoneOneController;
  final String emailTwoController;
  final String phoneTwoController;
  final int groupId;
  final int techerId;

  final String actualselectedDate;
  final String relationOnefirstNameController;
  final String relationOneSecondNameController;
  final String relationOneThirdController;
  final String relationTwoFirstController;
  final String relationTwoScecondController;
  final String relationTwoThirdController;
  final String emergencyNameController;
  final String emergencyRelationController;

  final String streetController;
  final String cityController;
  final String stateController;
  final String postCodeController;
  final String givenNameController;
  final String surnameController;

  final XFile? familyCardPhoto;
  final XFile? vaccinationCertificate;
  final XFile? doctuumnet;

  FailuarAddChildCheckout({
    Key? key,
    required this.checkoutId,
    required this.selectedBranchIndex,
    required this.childNameController,
    required this.selectedType,
    required this.emergencyNumberController,
    required this.anthorNotesController,
    required this.selectedRelationsOne,
    required this.emailOneController,
    required this.selectedRelationsTwo,
    required this.sensitificController,
    required this.phoneOneController,
    required this.emailTwoController,
    required this.phoneTwoController,
    required this.familyCardPhoto,
    required this.vaccinationCertificate,
    required this.doctuumnet,
    required this.groupId,
    required this.techerId,
    required this.actualselectedDate,
    required this.relationOnefirstNameController,
    required this.relationOneSecondNameController,
    required this.relationOneThirdController,
    required this.relationTwoFirstController,
    required this.relationTwoScecondController,
    required this.relationTwoThirdController,
    required this.emergencyNameController,
    required this.emergencyRelationController,
    required this.streetController,
    required this.cityController,
    required this.stateController,
    required this.postCodeController,
    required this.givenNameController,
    required this.surnameController,
  }) : super(key: key);

  @override
  _FailuarAddChildCheckoutState createState() =>
      _FailuarAddChildCheckoutState();
}

class _FailuarAddChildCheckoutState extends State<FailuarAddChildCheckout> {
  PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Image.asset(
              AppImages.appLogo,
              width: 106,
              height: 56,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            Center(
              child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 50,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'فشل فى عملية الدفع',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'كود العملية...',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(height: 50),
            ActionButton(
              onPressed: () async {
                String error = await paymentController.getCheckoutId(
                  packageId: (selectedPackageIndex! + 1).toString(),
                  email: "${GetStorage().read('userEmail')}",
                  street: streetController.text,
                  city: cityController.text,
                  state: stateController.text,
                  postcode: postCodeController.text,
                  givenName: givenNameController.text,
                  surname: surnameController.text,
                  paymentMethod: seletctedBank,
                );
                if (error != "") {
                  Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
                } else {
                  Get.to(AddChildPaymentWebviewScreen(
                    selectedBranchIndex: widget.selectedBranchIndex,
                    childNameController: widget.childNameController,
                    selectedType: widget.selectedType,
                    selectedRelationsOne: widget.selectedRelationsOne,
                    selectedRelationsTwo: widget.selectedRelationsTwo,
                    emergencyNumberController: widget.emergencyNumberController,
                    anthorNotesController: widget.anthorNotesController,
                    sensitificController: widget.sensitificController,
                    phoneOneController: widget.phoneOneController,
                    emailOneController: widget.emailOneController,
                    emailTwoController: widget.emailTwoController,
                    phoneTwoController: widget.phoneTwoController,
                    familyCardPhoto: widget.familyCardPhoto,
                    vaccinationCertificate: widget.vaccinationCertificate,
                    doctuumnet: widget.doctuumnet,
                    groupId: widget.groupId,
                    techerId: widget.techerId,
                    checkoutId: "${GetStorage().read('checkoutId')}",
                    relationOnefirstNameController:
                        widget.relationOnefirstNameController,
                    relationOneSecondNameController:
                        widget.relationOneSecondNameController,
                    relationOneThirdController:
                        widget.relationOneThirdController,
                    relationTwoFirstController:
                        widget.relationTwoFirstController,
                    relationTwoScecondController:
                        widget.relationTwoScecondController,
                    relationTwoThirdController:
                        widget.relationTwoThirdController,
                    emergencyNameController: widget.emergencyNameController,
                    emergencyRelationController:
                        widget.emergencyRelationController,
                    streetController: streetController.text,
                    cityController: cityController.text,
                    stateController: stateController.text,
                    postCodeController: postCodeController.text,
                    givenNameController: givenNameController.text,
                    surnameController: surnameController.text,
                    actualselectedDate: widget.actualselectedDate,
                  ));
                }
              },
              label: 'المحاولة من جديد',
            )
          ],
        ),
      ),
    );
  }
}
