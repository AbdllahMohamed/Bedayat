import 'package:bedayat/UI/screens/checkout_status/register_checkout_status.dart';
import 'package:bedayat/UI/screens/login/login.dart';
import 'package:bedayat/UI/screens/payment_web_view/register_payment_web_view.dart';
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

int? selectedPackageIndex = 0;
TextEditingController streetController = new TextEditingController();
TextEditingController cityController = new TextEditingController();
TextEditingController stateController = new TextEditingController();
TextEditingController postCodeController = new TextEditingController();
TextEditingController givenNameController = new TextEditingController();
TextEditingController surnameController = new TextEditingController();
String? seletctedBank;
String? peroid = 'from7to2';

class RegisterStepFiveScreen extends StatefulWidget {
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  //final String location;
  final int selectedBranchIndex;
  final String childNameController;
  final String ageGroup;
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

  final String relationOnefirstNameController;
  final String relationOneSecondNameController;
  final String relationOneThirdController;
  final String relationTwoFirstController;
  final String relationTwoScecondController;
  final String relationTwoThirdController;
  final String emergencyNameController;
  final String emergencyRelationController;

  final XFile? familyCardPhoto;
  final XFile? vaccinationCertificate;
  final XFile? doctuumnet;

  const RegisterStepFiveScreen({
    Key? key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    //required this.location,
    required this.selectedBranchIndex,
    required this.childNameController,
    required this.ageGroup,
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
    required this.relationOnefirstNameController,
    required this.relationOneSecondNameController,
    required this.relationOneThirdController,
    required this.relationTwoFirstController,
    required this.relationTwoScecondController,
    required this.relationTwoThirdController,
    required this.emergencyNameController,
    required this.emergencyRelationController,
  }) : super(key: key);

  @override
  _RegisterStepFiveScreenState createState() => _RegisterStepFiveScreenState();
}

class _RegisterStepFiveScreenState extends State<RegisterStepFiveScreen> {
  PaymentController paymentController = Get.put(PaymentController());
  AuthController authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  final PackageController packageController = Get.put(PackageController());

  List<String> _banckImage = [
    AppImages.appMadaBank,
    AppImages.appVisa,
    AppImages.appMasterCaed,
  ];
  List<String> _banckName = [
    'Mada',
    'Visa',
    'Master Card',
  ];

  List<String> _peroids = [
    'من 2 الى 7',
    'من 5 الى 7',
  ];
  String _selectedPeroid = 'من 2 الى 7';
  int? selectedBankIndex;
  int? updatePakageIndex = 0;

  @override
  void initState() {
    super.initState();
    print(widget.familyCardPhoto!.path);
    print(widget.vaccinationCertificate);
    print(widget.doctuumnet);
  }

  registerStepFive() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (selectedPackageIndex == 0) {
      Get.defaultDialog(
          title: "حدث خطأ ما", middleText: 'يرجى اختيار قيمة الاشتراك');
      return;
    }
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

    print(error);
    if (error != "") {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    } else {
      kIsWeb
          ? _registerAndavegatoToWeb()
          : Get.to(RegisterPaymentWebviewScreen());

      // Get.to(
      //   RegisterPaymentWebviewScreen(
      //     nameController: widget.nameController,
      //     phoneController: widget.phoneController,
      //     emailController: widget.emailController,
      //     passwordController: widget.passwordController,
      //     selectedBranchIndex: widget.selectedBranchIndex,
      //     childNameController: widget.childNameController,
      //     //selectedAge: widget.selectedAge,
      //     selectedType: widget.selectedType,
      //     selectedRelationsOne: widget.selectedRelationsOne,
      //     selectedRelationsTwo: widget.selectedRelationsTwo,
      //     emergencyNumberController: widget.emergencyNumberController,
      //     anthorNotesController: widget.anthorNotesController,
      //     sensitificController: widget.sensitificController,
      //     emailOneController: widget.emailController,
      //     phoneOneController: widget.phoneOneController,
      //     emailTwoController: widget.emailTwoController,
      //     phoneTwoController: widget.phoneTwoController,
      //     familyCardPhoto: widget.familyCardPhoto,
      //     vaccinationCertificate: widget.vaccinationCertificate,
      //     doctuumnet: widget.doctuumnet,
      //     groupId: widget.groupId,
      //     techerId: widget.techerId,
      //     checkoutId: "${GetStorage().read('checkoutId')}",
      //     actualselectedDate: widget.actualselectedDate,
      //     relationOnefirstNameController: widget.relationOnefirstNameController,
      //     relationOneSecondNameController:
      //         widget.relationOneSecondNameController,
      //     relationOneThirdController: widget.relationOneThirdController,
      //     relationTwoFirstController: widget.relationTwoFirstController,
      //     relationTwoScecondController: widget.relationTwoScecondController,
      //     relationTwoThirdController: widget.relationTwoThirdController,
      //     emergencyNameController: widget.emergencyNameController,
      //     emergencyRelationController: widget.emergencyRelationController,
      //     streetController: streetController.text,
      //     cityController: cityController.text,
      //     stateController: stateController.text,
      //     postCodeController: postCodeController.text,
      //     givenNameController: givenNameController.text,
      //     surnameController: surnameController.text,
      //   ),
      // );
    }
  }

  void _registerAndavegatoToWeb() async {
    String registerError = await authController.registerWeb(
      username: widget.nameController,
      email: widget.emailController,
      phone: widget.phoneController,
      password: widget.passwordController,
      childname: widget.childNameController,
      gender: widget.selectedType == 'ولد' ? 'male' : 'female',
      emergencyNumber: widget.emergencyNumberController,
      parentOneRealation: widget.selectedRelationsOne,
      parentOneEmail: widget.emailOneController,
      parentOnePhone: widget.phoneOneController,
      parentTwoRealation: widget.selectedRelationsTwo,
      parentTwoEmail: widget.emailTwoController,
      parentTwoPhone: widget.phoneTwoController,
      userId: "1",
      ageGroup: widget.ageGroup,
      teacherId: widget.techerId.toString(),
      groupId: widget.groupId.toString(),
      familyCard: widget.familyCardPhoto,
      vaccinationCertificate: widget.vaccinationCertificate,
      document: widget.doctuumnet!,
      checkoutId: "${GetStorage().read('checkoutId')}",
      relationOnefirstNameController: widget.relationOnefirstNameController,
      relationOneSecondNameController: widget.relationOneSecondNameController,
      relationOneThirdController: widget.relationOneThirdController,
      relationTwoFirstController: widget.relationTwoFirstController,
      relationTwoScecondController: widget.relationTwoScecondController,
      relationTwoThirdController: widget.relationTwoThirdController,
      emergencyNameController: widget.emergencyNameController,
      emergencyRelationController: widget.emergencyRelationController,
      streetController: streetController.text,
      cityController: cityController.text,
      stateController: stateController.text,
      postCodeController: postCodeController.text,
      givenNameController: givenNameController.text,
      surnameController: surnameController.text,
    );
    if (registerError != "") {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: registerError);
    } else {
      await authController
          .login(
        widget.emailController,
        widget.passwordController,
      )
          .then((value) {
        Get.to(RegisterPaymentWebviewScreen());
      });
    }
  }

  void _changePakge(peroid) {
    print(
        'packageController.packageList.length ${packageController.packageList.length}');

    setState(() {
      packageController.pakagesSelection = packageController.packageList
          .where((item) => item.period == peroid)
          .toList();
      print(packageController.pakagesSelection.length);
    });
  }
  // void _launchURL() {
  //   js.context.callMethod(
  //       'open', [baseUrl + 'payments/${GetStorage().read('checkoutId')}']);

  //   showDialog(
  //     context: this.context,
  //     builder: (contetx) => Container(
  //       height: 250,
  //       width: 300,
  //       child: new AlertDialog(
  //         content: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             CircularProgressIndicator(),
  //             SizedBox(height: 10),
  //             Text("من فضلك قم بتأكيد الدفع ثم اضغظ على التالى "),
  //             SizedBox(height: 10),
  //             ElevatedButton(
  //               onPressed: () {
  //                 Get.to(RegisterCheckoutStautusScreen(
  //                   nameController: widget.nameController,
  //                   phoneController: widget.phoneController,
  //                   emailController: widget.emailController,
  //                   passwordController: widget.passwordController,
  //                   selectedBranchIndex: widget.selectedBranchIndex,
  //                   childNameController: widget.childNameController,
  //                   selectedAge: widget.selectedAge,
  //                   selectedType: widget.selectedType,
  //                   selectedRelationsOne: widget.selectedRelationsOne,
  //                   selectedRelationsTwo: widget.selectedRelationsTwo,
  //                   emergencyNumberController: widget.emergencyNumberController,
  //                   anthorNotesController: widget.anthorNotesController,
  //                   sensitificController: widget.sensitificController,
  //                   emailOneController: widget.emailController,
  //                   phoneOneController: widget.phoneOneController,
  //                   emailTwoController: widget.emailTwoController,
  //                   phoneTwoController: widget.phoneTwoController,
  //                   familyCardPhoto: widget.familyCardPhoto,
  //                   vaccinationCertificate: widget.vaccinationCertificate,
  //                   doctuumnet: widget.doctuumnet,
  //                   groupId: widget.groupId,
  //                   techerId: widget.techerId,
  //                   checkoutId: '${GetStorage().read('checkoutId')}',
  //                 ));
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 primary: AppColors.primaryColor,
  //                 minimumSize: Size(
  //                   200,
  //                   55,
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(8), // <-- Radius
  //                 ),
  //               ),
  //               child: Text(
  //                 'التالى',
  //                 style: TextStyle(
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.w600,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                          'التسجيل',
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
                            '5/6',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 10,
                        ),
                        child: Text(
                          'اختر الفترة  : ',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: 120,
                          height: 65,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: Color(0xffAA9E9E),
                              isExpanded: true,
                              iconSize: 30,
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  _selectedPeroid,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedPeroid = newValue.toString();
                                });
                                if (_selectedPeroid == 'من 2 الى 7')
                                  _changePakge('from7to2');
                                if (_selectedPeroid == 'من 5 الى 7')
                                  _changePakge('from7to5');
                              },
                              items: _peroids.map((country) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    country.toString(),
                                    style: TextStyle(
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                  value: country.toString(),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                height: 290,
                                margin: EdgeInsets.only(
                                    right: 10, left: 10, bottom: 10),
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
                                        shrinkWrap: true,
                                        itemCount: packageController
                                            .pakagesSelection.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedPackageIndex =
                                                    packageController
                                                        .pakagesSelection[index]
                                                        .id!;
                                                updatePakageIndex = index;
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
                                                          packageController
                                                              .pakagesSelection[
                                                                  index]
                                                              .id
                                                      ? AppColors.primaryColor
                                                      : Colors.grey,
                                                  width: selectedPackageIndex ==
                                                          packageController
                                                              .pakagesSelection[
                                                                  index]
                                                              .id
                                                      ? 3
                                                      : 1,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${packageController.pakagesSelection[index].title!}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${packageController.pakagesSelection[index].price!} \nريال',
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
                                            'السعر',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.accentColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          selectedPackageIndex == 0
                                              ? SizedBox()
                                              : Text(
                                                  '${packageController.pakagesSelection[updatePakageIndex!].price!} ريال',
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
                                          selectedPackageIndex == 0
                                              ? SizedBox()
                                              : Text(
                                                  '${packageController.pakagesSelection[updatePakageIndex!].tax!} ريال',
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
                                          selectedPackageIndex == 0
                                              ? SizedBox()
                                              : Text(
                                                  '${(double.parse(packageController.pakagesSelection[updatePakageIndex!].price!) + double.parse(packageController.pakagesSelection[updatePakageIndex!].tax!)).toString()} ريال',
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
                    itemCount: _banckName.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedBankIndex = index;
                            seletctedBank = _banckName[selectedBankIndex!];
                            print(seletctedBank);
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
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'متطلبات الفاتورة',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: givenNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                        if (val.length < 3) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.person, color: AppColors.accentColor),
                        hintText: 'الاسم الاول',
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: surnameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                        if (val.length < 3) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.person, color: AppColors.accentColor),
                        hintText: 'الاسم الثانى',
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: streetController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                        if (val.length < 3) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home_rounded,
                            color: AppColors.accentColor),
                        hintText: 'الشارع',
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: cityController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                        if (val.length < 3) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home_outlined,
                            color: AppColors.accentColor),
                        hintText: 'المدينة',
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: stateController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                        if (val.length < 3) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city_rounded,
                            color: AppColors.accentColor),
                        hintText: 'المقاطعة',
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: postCodeController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                        if (val.length < 3) {
                          return 'من فضلك ادخل قيمة صحيحة';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.post_add_sharp,
                            color: AppColors.accentColor),
                        hintText: 'الرمز البريدي',
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                        registerStepFive();
                      }),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
