import 'package:bedayat/UI/screens/payment_web_view/add_child_payment_web_view.dart';
import 'package:bedayat/UI/screens/payment_web_view/register_payment_web_view.dart';
import 'package:bedayat/UI/screens/register/register_step_six.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_services.dart';
import 'package:bedayat/controllers/package_controller.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddChildStepFourScreen extends StatefulWidget {
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

  const AddChildStepFourScreen({
    Key? key,
    required this.selectedBranchIndex,
    required this.childNameController,
    required this.selectedAge,
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
  }) : super(key: key);

  @override
  _AddChildStepFourScreenState createState() => _AddChildStepFourScreenState();
}

class _AddChildStepFourScreenState extends State<AddChildStepFourScreen> {
  AuthController authController = Get.put(AuthController());
  PaymentController paymentController = Get.put(PaymentController());

  final PackageController packageController = Get.put(PackageController());
  int? selectedPackageIndex = 0;

  List<String> _banckImage = [
    AppImages.appMadaBank,
    AppImages.appStcpayBank,
  ];
  List<String> _banckName = [
    'مدى',
    'STC Pay',
  ];
  int? selectedBankIndex = 0;

  addChildStepFour() async {
    String paymentError = await paymentController
        .getCheckoutId((selectedPackageIndex! + 1).toString());
    if (paymentError != "") {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: paymentError);
    } else {
      Get.to(
        AddChildPaymentWebviewScreen(
          selectedBranchIndex: widget.selectedBranchIndex,
          childNameController: widget.childNameController,
          selectedAge: widget.selectedAge,
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
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Image.asset(
                    AppImages.appSubLogo,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اضافة طفل',
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
                          '4/5',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'الدفع',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Obx(
                  () => packageController.loadingProcess.value
                      ? Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 100, bottom: 70),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.accentColor,
                              ),
                            ),
                          ),
                        )
                      : packageController.packageList.length == 0
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 200.0),
                                child: Text(
                                  'لاتوجد بيانات',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: AppColors.accentColor),
                                ),
                              ),
                            )
                          : Container(
                              height: 300,
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 98,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          packageController.packageList.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedPackageIndex = index;
                                            });
                                          },
                                          child: Container(
                                            width: 95,
                                            height: 95,
                                            margin: EdgeInsets.only(left: 5),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors
                                                  .selectedPaymentColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: selectedPackageIndex ==
                                                        index
                                                    ? AppColors.primaryColor
                                                    : Colors.grey,
                                                width: selectedPackageIndex ==
                                                        index
                                                    ? 4
                                                    : 1,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${packageController.packageList[index].title!}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                Text(
                                                  '${packageController.packageList[index].price!} \nريال',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Text(
                                      'الفاتورة',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.titleColor,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'الاجمالى',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.accentColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          '${packageController.packageList[selectedPackageIndex!].price!} ريال',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.titleColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'الضريبة',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.accentColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          '${packageController.packageList[selectedPackageIndex!].tax!} ريال',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.titleColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),
                                    child: Divider(
                                      color: Color(0xffE9E1E1),
                                      thickness: 1.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'الاجمالى',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.accentColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          '${(double.parse(packageController.packageList[selectedPackageIndex!].price!) + double.parse(packageController.packageList[selectedPackageIndex!].tax!)).toString()} ريال',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.titleColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'الفاتورة',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedBankIndex = index;
                        });
                      },
                      child: Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedBankIndex == index
                                ? AppColors.primaryColor
                                : Colors.grey,
                            width: selectedBankIndex == index ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Image.asset(_banckImage[index]),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              _banckName[index],
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.titleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'بالتسجيل فانت توافق علي الشروط و الاحكام',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ActionButton(
                    label: 'التالى',
                    onPressed: () async {
                      addChildStepFour();
                    }),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
