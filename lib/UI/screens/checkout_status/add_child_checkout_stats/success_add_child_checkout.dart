import 'package:bedayat/UI/screens/add_child/add_child_step_five.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessAddChildCheckout extends StatefulWidget {
  // final String checkoutId;
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

  // SuccessAddChildCheckout({
  //   Key? key,
  //   required this.checkoutId,
  //   required this.selectedBranchIndex,
  //   required this.childNameController,
  //   required this.selectedType,
  //   required this.emergencyNumberController,
  //   required this.anthorNotesController,
  //   required this.selectedRelationsOne,
  //   required this.emailOneController,
  //   required this.selectedRelationsTwo,
  //   required this.sensitificController,
  //   required this.phoneOneController,
  //   required this.emailTwoController,
  //   required this.phoneTwoController,
  //   required this.familyCardPhoto,
  //   required this.vaccinationCertificate,
  //   required this.doctuumnet,
  //   required this.groupId,
  //   required this.techerId,
  //   required this.actualselectedDate,
  //   required this.relationOnefirstNameController,
  //   required this.relationOneSecondNameController,
  //   required this.relationOneThirdController,
  //   required this.relationTwoFirstController,
  //   required this.relationTwoScecondController,
  //   required this.relationTwoThirdController,
  //   required this.emergencyNameController,
  //   required this.emergencyRelationController,
  //   required this.streetController,
  //   required this.cityController,
  //   required this.stateController,
  //   required this.postCodeController,
  //   required this.givenNameController,
  //   required this.surnameController,
  // }) : super(key: key);

  @override
  _SuccessAddChildCheckoutState createState() =>
      _SuccessAddChildCheckoutState();
}

class _SuccessAddChildCheckoutState extends State<SuccessAddChildCheckout> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    // _addChildAndavegatoTo();
    _navigateTo();
  }

  // void _addChildAndavegatoTo() async {
  //   String addchildError = await authController.addChild(
  //     childname: widget.childNameController,
  //     gender: widget.selectedType == 'ولد' ? 'male' : 'female',
  //     emergencyNumber: widget.emergencyNumberController,
  //     parentOneRealation: widget.selectedRelationsOne,
  //     parentOneEmail: widget.emailOneController,
  //     parentOnePhone: widget.phoneOneController,
  //     parentTwoRealation: widget.selectedRelationsTwo,
  //     parentTwoEmail: widget.emailTwoController,
  //     parentTwoPhone: widget.phoneTwoController,
  //     userId: "1",
  //     teacherId: widget.techerId.toString(),
  //     groupId: widget.groupId.toString(),
  //     familyCard: widget.familyCardPhoto,
  //     vaccinationCertificate: widget.vaccinationCertificate,
  //     document: widget.doctuumnet!,
  //     actualselectedDate: widget.actualselectedDate,
  //     relationOnefirstNameController: widget.relationOnefirstNameController,
  //     relationOneSecondNameController: widget.relationOneSecondNameController,
  //     relationOneThirdController: widget.relationOneThirdController,
  //     relationTwoFirstController: widget.relationTwoFirstController,
  //     relationTwoScecondController: widget.relationTwoScecondController,
  //     relationTwoThirdController: widget.relationTwoThirdController,
  //     emergencyNameController: widget.emergencyNameController,
  //     emergencyRelationController: widget.emergencyRelationController,
  //     streetController: widget.streetController,
  //     cityController: widget.cityController,
  //     stateController: widget.stateController,
  //     postCodeController: widget.postCodeController,
  //     givenNameController: widget.givenNameController,
  //     surnameController: widget.surnameController,
  //   );
  //   print('addchildError');
  //   print(addchildError);
  //   if (addchildError != "") {
  //     Get.defaultDialog(title: "حدث خطأ ما", middleText: addchildError);
  //   } else {
  //     Future.delayed(Duration(milliseconds: 200), () {
  //       Get.to(AddChildStepFiveScreen());
  //     });
  //   }
  // }
  _navigateTo() {
    Future.delayed(Duration(milliseconds: 200), () {
      Get.to(AddChildStepFiveScreen());
    });
  }

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
                    Icons.check,
                    size: 50,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'تم الدفع بنجاح',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'جارى إتمام الدفع...',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.w200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
