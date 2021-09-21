import 'package:bedayat/UI/screens/payment_web_view/register_payment_web_view.dart';
import 'package:bedayat/UI/screens/register/register_step_five.dart';
import 'package:bedayat/UI/screens/register/register_step_six.dart';
import 'package:bedayat/controllers/auth_services.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/checkout_status_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterCheckoutStautusScreen extends StatefulWidget {
  String checkoutId;
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  //final String location;
  final int selectedBranchIndex;
  final String childNameController;
  final String selectedAge;
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

  final XFile? familyCardPhoto;
  final XFile? vaccinationCertificate;
  final XFile? doctuumnet;
  RegisterCheckoutStautusScreen(
      {Key? key,
      required this.checkoutId,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.selectedBranchIndex,
      required this.childNameController,
      required this.selectedAge,
      required this.selectedType,
      required this.selectedRelationsOne,
      required this.selectedRelationsTwo,
      required this.emergencyNumberController,
      required this.anthorNotesController,
      required this.sensitificController,
      required this.emailOneController,
      required this.phoneOneController,
      required this.emailTwoController,
      required this.phoneTwoController,
      required this.groupId,
      required this.techerId,
      required this.familyCardPhoto,
      required this.vaccinationCertificate,
      required this.doctuumnet})
      : super(key: key);

  @override
  _RegisterCheckoutStautusScreenState createState() =>
      _RegisterCheckoutStautusScreenState();
}

class _RegisterCheckoutStautusScreenState
    extends State<RegisterCheckoutStautusScreen> {
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
                      ? SucessCheckout(
                          nameController: widget.nameController,
                          phoneController: widget.phoneController,
                          emailController: widget.emailController,
                          passwordController: widget.passwordController,
                          selectedBranchIndex: widget.selectedBranchIndex,
                          childNameController: widget.childNameController,
                          selectedAge: widget.selectedAge,
                          selectedType: widget.selectedType,
                          selectedRelationsOne: widget.selectedRelationsOne,
                          selectedRelationsTwo: widget.selectedRelationsTwo,
                          emergencyNumberController:
                              widget.emergencyNumberController,
                          anthorNotesController: widget.anthorNotesController,
                          sensitificController: widget.sensitificController,
                          emailOneController: widget.emailController,
                          phoneOneController: widget.phoneOneController,
                          emailTwoController: widget.emailTwoController,
                          phoneTwoController: widget.phoneTwoController,
                          familyCardPhoto: widget.familyCardPhoto,
                          vaccinationCertificate: widget.vaccinationCertificate,
                          doctuumnet: widget.doctuumnet,
                          groupId: widget.groupId,
                          techerId: widget.techerId,
                          checkoutId: widget.checkoutId,
                        )
                      : FailuarCheckot(
                          nameController: widget.nameController,
                          phoneController: widget.phoneController,
                          emailController: widget.emailController,
                          passwordController: widget.passwordController,
                          selectedBranchIndex: widget.selectedBranchIndex,
                          childNameController: widget.childNameController,
                          selectedAge: widget.selectedAge,
                          selectedType: widget.selectedType,
                          selectedRelationsOne: widget.selectedRelationsOne,
                          selectedRelationsTwo: widget.selectedRelationsTwo,
                          emergencyNumberController:
                              widget.emergencyNumberController,
                          anthorNotesController: widget.anthorNotesController,
                          sensitificController: widget.sensitificController,
                          emailOneController: widget.emailController,
                          phoneOneController: widget.phoneOneController,
                          emailTwoController: widget.emailTwoController,
                          phoneTwoController: widget.phoneTwoController,
                          familyCardPhoto: widget.familyCardPhoto,
                          vaccinationCertificate: widget.vaccinationCertificate,
                          doctuumnet: widget.doctuumnet,
                          groupId: widget.groupId,
                          techerId: widget.techerId,
                          checkoutId: "${GetStorage().read('checkoutId')}",
                        );
                },
              ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SucessCheckout extends StatefulWidget {
  String checkoutId;
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  //final String location;
  final int selectedBranchIndex;
  final String childNameController;
  final String selectedAge;
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

  final XFile? familyCardPhoto;
  final XFile? vaccinationCertificate;
  final XFile? doctuumnet;
  SucessCheckout(
      {Key? key,
      required this.checkoutId,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.selectedBranchIndex,
      required this.childNameController,
      required this.selectedAge,
      required this.selectedType,
      required this.selectedRelationsOne,
      required this.selectedRelationsTwo,
      required this.emergencyNumberController,
      required this.anthorNotesController,
      required this.sensitificController,
      required this.emailOneController,
      required this.phoneOneController,
      required this.emailTwoController,
      required this.phoneTwoController,
      required this.groupId,
      required this.techerId,
      required this.familyCardPhoto,
      required this.vaccinationCertificate,
      required this.doctuumnet})
      : super(key: key);

  @override
  _SucessCheckoutState createState() => _SucessCheckoutState();
}

class _SucessCheckoutState extends State<SucessCheckout> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _registerAndavegatoTo();
  }

  void _registerAndavegatoTo() async {
    String registerError = await authController.register(
      username: widget.nameController,
      email: widget.emailController,
      phone: widget.phoneController,
      password: widget.passwordController,
      childname: widget.childNameController,
      ageGroup: widget.selectedAge,
      gender: widget.selectedType == 'ولد' ? 'male' : 'female',
      emergencyNumber: widget.emergencyNumberController,
      parentOneRealation: widget.selectedRelationsOne,
      parentOneEmail: widget.emailOneController,
      parentOnePhone: widget.phoneOneController,
      parentTwoRealation: widget.selectedRelationsTwo,
      parentTwoEmail: widget.emailTwoController,
      parentTwoPhone: widget.phoneTwoController,
      userId: "1",
      teacherId: widget.techerId.toString(),
      groupId: widget.groupId.toString(),
      familyCard: widget.familyCardPhoto,
      vaccinationCertificate: widget.vaccinationCertificate,
      document: widget.doctuumnet!,
    );
    if (registerError != "") {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: registerError);
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Get.to(RegisterStepSixScreen());
      });
    }
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

// ignore: must_be_immutable
class FailuarCheckot extends StatefulWidget {
  String checkoutId;
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  //final String location;
  final int selectedBranchIndex;
  final String childNameController;
  final String selectedAge;
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

  final XFile? familyCardPhoto;
  final XFile? vaccinationCertificate;
  final XFile? doctuumnet;
  FailuarCheckot(
      {Key? key,
      required this.checkoutId,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.selectedBranchIndex,
      required this.childNameController,
      required this.selectedAge,
      required this.selectedType,
      required this.selectedRelationsOne,
      required this.selectedRelationsTwo,
      required this.emergencyNumberController,
      required this.anthorNotesController,
      required this.sensitificController,
      required this.emailOneController,
      required this.phoneOneController,
      required this.emailTwoController,
      required this.phoneTwoController,
      required this.groupId,
      required this.techerId,
      required this.familyCardPhoto,
      required this.vaccinationCertificate,
      required this.doctuumnet})
      : super(key: key);

  @override
  _FailuarCheckotState createState() => _FailuarCheckotState();
}

class _FailuarCheckotState extends State<FailuarCheckot> {
  AuthController authController = Get.put(AuthController());
  PaymentController paymentController = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();
    _registerAndavegatoTo();
  }

  void _registerAndavegatoTo() async {
    String registerError = await authController.registerWeb(
      username: widget.nameController,
      email: widget.emailController,
      phone: widget.phoneController,
      password: widget.passwordController,
      childname: widget.childNameController,
      ageGroup: widget.selectedAge,
      gender: widget.selectedType == 'ولد' ? 'male' : 'female',
      emergencyNumber: widget.emergencyNumberController,
      parentOneRealation: widget.selectedRelationsOne,
      parentOneEmail: widget.emailOneController,
      parentOnePhone: widget.phoneOneController,
      parentTwoRealation: widget.selectedRelationsTwo,
      parentTwoEmail: widget.emailTwoController,
      parentTwoPhone: widget.phoneTwoController,
      userId: "1",
      teacherId: widget.techerId.toString(),
      groupId: widget.groupId.toString(),
      familyCard: widget.familyCardPhoto,
      vaccinationCertificate: widget.vaccinationCertificate,
      document: widget.doctuumnet!,
    );
    if (registerError != "") {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: registerError);
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Get.to(RegisterStepSixScreen());
      });
    }
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
                  email: widget.emailController,
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
                  Get.to(RegisterPaymentWebviewScreen(
                    nameController: widget.nameController,
                    phoneController: widget.phoneController,
                    emailController: widget.emailController,
                    passwordController: widget.passwordController,
                    selectedBranchIndex: widget.selectedBranchIndex,
                    childNameController: widget.childNameController,
                    selectedAge: widget.selectedAge,
                    selectedType: widget.selectedType,
                    selectedRelationsOne: widget.selectedRelationsOne,
                    selectedRelationsTwo: widget.selectedRelationsTwo,
                    emergencyNumberController: widget.emergencyNumberController,
                    anthorNotesController: widget.anthorNotesController,
                    sensitificController: widget.sensitificController,
                    emailOneController: widget.emailController,
                    phoneOneController: widget.phoneOneController,
                    emailTwoController: widget.emailTwoController,
                    phoneTwoController: widget.phoneTwoController,
                    familyCardPhoto: widget.familyCardPhoto,
                    vaccinationCertificate: widget.vaccinationCertificate,
                    doctuumnet: widget.doctuumnet,
                    groupId: widget.groupId,
                    techerId: widget.techerId,
                    checkoutId: "${GetStorage().read('checkoutId')}",
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
